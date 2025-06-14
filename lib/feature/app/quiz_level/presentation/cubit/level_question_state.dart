part of 'level_question_cubit.dart';

class LevelQuestionState {
  final Status levelQuestionState;
  final String? levelQuestionError;
  final List<QuestionEntity>? levelQuestionList;
  final Exception? exception;
  final int selectedAnswer;
  final double timeLeft;
  final double finalScore;

  const LevelQuestionState({
     this.levelQuestionState = Status.initial,
    this.levelQuestionError,
    this.levelQuestionList,
    this.exception,
    this.selectedAnswer = -1,
    this.timeLeft = 30,
    this.finalScore = 0,
  });

  LevelQuestionState copyWith({
    Status? levelQuestionState,
    String? levelQuestionError,
    List<QuestionEntity>? levelQuestionList,
    Exception? exception,
    int? selectedAnswer,
    double? timeLeft,
    double? finalScore,
  }) {
    return LevelQuestionState(
      levelQuestionState: levelQuestionState ?? this.levelQuestionState,
      levelQuestionError: levelQuestionError ?? this.levelQuestionError,
      levelQuestionList: levelQuestionList ?? this.levelQuestionList,
      exception: exception ?? this.exception,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
      timeLeft: timeLeft ?? this.timeLeft,
      finalScore: finalScore ?? this.finalScore,
    );
  }
}


