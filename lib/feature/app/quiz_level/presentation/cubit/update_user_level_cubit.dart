import 'package:acm_online/feature/app/quiz_level/data/models/update_user_level_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/result.dart';
import '../../../../../core/utils/status.dart';
import '../../data/models/level_quesiton_dto.dart';
import '../../data/repositories/level_question_repo_impl.dart';

part 'update_user_level_state.dart';


@injectable
class UpdateUserLevelCubit extends Cubit<UpdateUserLevelState> {
  UpdateUserLevelCubit(this._repo) : super(const UpdateUserLevelState());

  final UpdateUserLevelRepo _repo;

  Future<void> updateUserLevel(String level) async {
    emit(state.copyWith(updateUserLevelState: Status.loading));

    final result = await _repo.updateUserLevel(level);

    switch (result) {
      case ApiSuccessResult<UpdateUserLevelResponse>():
        emit(
          state.copyWith(
            updateUserLevelList: result.data,
            updateUserLevelState: Status.success,
          ),
        );

      case ApiErrorResult<UpdateUserLevelResponse>():
        emit(
          state.copyWith(
            updateUserLevelError: result.failures.toString(),
            updateUserLevelState: Status.error,
          ),
        );
    }
  }

  Future<void> getLevelingQuestion(int subCategoryId) async {
    emit(state.copyWith(updateUserLevelState: Status.loading));

    final result = await _repo.getLevelingQuestion(subCategoryId);

    switch (result) {
      case ApiSuccessResult<QuestionResponse>():
        emit(
          state.copyWith(
            levelingQuestionList: result.data,
            levelingQuestionState: Status.success,
          ),
        );

      case ApiErrorResult<QuestionResponse>():
        emit(
          state.copyWith(
            levelingQuestionError: result.failures.toString(),
            levelingQuestionState: Status.error,
          ),
        );
    }
  }
}
