part of 'update_user_level_cubit.dart';

class UpdateUserLevelState {

  final Status updateUserLevelState;
  final Status levelingQuestionState;
  final String? updateUserLevelError;
  final String? levelingQuestionError;
  final UpdateUserLevelResponse ? updateUserLevelList;
  final QuestionResponse ? levelingQuestionList;

  const UpdateUserLevelState({
    this.updateUserLevelState = Status.initial,
    this.levelingQuestionState = Status.initial,
    this.levelingQuestionError,
    this.updateUserLevelError,
    this.updateUserLevelList,
    this.levelingQuestionList
  });

  UpdateUserLevelState copyWith({
    Status? updateUserLevelState,
    Status? levelingQuestionState,
    String? updateUserLevelError,
    String? levelingQuestionError,
    UpdateUserLevelResponse? updateUserLevelList,
    QuestionResponse? levelingQuestionList,
  }) {
    return UpdateUserLevelState(
      updateUserLevelState: updateUserLevelState ?? this.updateUserLevelState,
      levelingQuestionState: levelingQuestionState ?? this.levelingQuestionState,
      updateUserLevelError: updateUserLevelError ?? this.updateUserLevelError,
      levelingQuestionError: levelingQuestionError ?? this.levelingQuestionError,
      updateUserLevelList: updateUserLevelList ?? this.updateUserLevelList,
      levelingQuestionList: levelingQuestionList ?? this.levelingQuestionList,
    );
  }

}

