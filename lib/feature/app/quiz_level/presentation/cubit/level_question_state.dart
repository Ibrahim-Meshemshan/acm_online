part of 'level_question_cubit.dart';

class LevelQuestionState {
  final Status levelQuestionState;
  final String? levelQuestionError;
  final List<QuestionEntity>? levelQuestionList;
  final Exception? exception;
  final int selectedAnswer;
  final double timeLeft;
  final double finalScore;

  // ===========TODO: Resources =======

  final Status resourcesState;
  final String? resourcesError;
  final List<ResourcesEntity>? resourcesList;

  const LevelQuestionState({
     this.levelQuestionState = Status.initial,
     this.resourcesState = Status.initial,
    this.resourcesError,
    this.resourcesList,
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
    Status? resourcesState,
    String? resourcesError,
    List<ResourcesEntity>? resourcesList,
  }) {
    return LevelQuestionState(
      levelQuestionState: levelQuestionState ?? this.levelQuestionState,
      levelQuestionError: levelQuestionError ?? this.levelQuestionError,
      levelQuestionList: levelQuestionList ?? this.levelQuestionList,
      exception: exception ?? this.exception,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
      timeLeft: timeLeft ?? this.timeLeft,
      finalScore: finalScore ?? this.finalScore,
      resourcesState: resourcesState ?? this.resourcesState,
      resourcesError: resourcesError ?? this.resourcesError,
      resourcesList: resourcesList ?? this.resourcesList,
    );
  }
}


