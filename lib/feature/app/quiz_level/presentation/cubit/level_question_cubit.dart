import 'dart:async';

import 'package:acm_online/feature/app/quiz_level/domain/entities/level_question_entity.dart';
import 'package:acm_online/feature/app/quiz_level/domain/use_cases/level_question_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/models/result.dart';
import '../../../../../core/utils/status.dart';
import '../../../levels/presentation/pages/resources_screen.dart';


part 'level_question_state.dart';

@injectable
class LevelQuestionCubit extends Cubit<LevelQuestionState> {
  LevelQuestionCubit({required this.useCase}) : super(const LevelQuestionState());

  final LevelQuestionUseCase useCase;
  Timer? _timer;
  int currentIndex = 0;
  int selectedAnswer = -1;
  int score = 0;
  double timeLeft = 30;
  bool showFeedback = false;
  bool _isAnswerVerified = false;

  Future<void> fetchLevelQuestion() async {
    emit(state.copyWith(levelQuestionState: Status.loading));

    final result = await useCase.call();
    switch (result) {
      case ApiSuccessResult<List<QuestionEntity>>():
        emit(state.copyWith(
          levelQuestionList: result.data,
          levelQuestionState: Status.success,
        ));
        startTimer();
      case ApiErrorResult<List<QuestionEntity>>():
        emit(state.copyWith(
          levelQuestionError: result.failures.toString(),
          levelQuestionState: Status.error,
        ));
    }
  }




  void startTimer() {
    _timer?.cancel();
    timeLeft = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        timeLeft--;
        emit(state.copyWith(timeLeft: timeLeft));
      } else {
        timer.cancel();
        if (!isClosed) verifyAnswer();
      }
    });
  }

  void selectAnswer(int answerIndex) {
    if (isClosed || _isAnswerVerified) return;
    selectedAnswer = answerIndex;
    emit(state.copyWith(selectedAnswer: answerIndex));
  }

  void verifyAnswer() {
    if (selectedAnswer == -1 || _isAnswerVerified) return;

    showFeedback = true;
    _isAnswerVerified = true;

    final currentQuestion = state.levelQuestionList?[currentIndex];
    if (currentQuestion?.options?[selectedAnswer] == currentQuestion?.correctAnswer) {
      score++;
    }

    emit(state.copyWith());
  }

  void nextQuestion() {
    if (!_isAnswerVerified && selectedAnswer != -1) {
      verifyAnswer();
      return;
    }

    if (currentIndex < (state.levelQuestionList?.length ?? 0) - 1) {
      _moveToQuestion(currentIndex + 1);
    } else {
      _showFinalScore();
    }
  }

  void previousQuestion() {
    if (currentIndex > 0) {
      _moveToQuestion(currentIndex - 1);
    }
  }

  void _moveToQuestion(int newIndex) {
    showFeedback = false;
    _isAnswerVerified = false;
    currentIndex = newIndex;
    selectedAnswer = -1;
    timeLeft = 30;
    emit(state.copyWith());
    startTimer();
  }

  void _showFinalScore() {
    _timer?.cancel();
    final percentage = state.levelQuestionList?.isNotEmpty ?? false
        ? (score / state.levelQuestionList!.length) * 100
        : 0.0;

    emit(state.copyWith(
      levelQuestionState: Status.completed,
      finalScore: percentage,
    ));
  }

  bool isAnswerCorrect(int answerIndex) {
    if (showFeedback && answerIndex == selectedAnswer) {
      return state.levelQuestionList?[currentIndex].options?[answerIndex] ==
          state.levelQuestionList?[currentIndex].correctAnswer;
    }
    return false;
  }

  bool isCorrectAnswer(int answerIndex) {
    return state.levelQuestionList?[currentIndex].options?[answerIndex] ==
        state.levelQuestionList?[currentIndex].correctAnswer;
  }


  void navigateToResources(BuildContext context, String level) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResourcesScreen(),
      ),
    );
  }
  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}