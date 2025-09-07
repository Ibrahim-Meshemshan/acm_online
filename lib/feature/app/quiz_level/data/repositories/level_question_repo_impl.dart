import 'package:acm_online/core/models/result.dart';
import 'package:acm_online/feature/app/quiz_level/data/data_sources/level_question_data_source.dart';

import 'package:acm_online/feature/app/quiz_level/domain/entities/level_question_entity.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/exceptions/failures.dart';
import '../../domain/repositories/level_question_repo.dart';
import '../models/level_quesiton_dto.dart';
import '../models/update_user_level_response_model.dart';

@Injectable(as: LevelQuestionRepo)
class LevelQuestionRepoImpl implements LevelQuestionRepo {
  final LevelQuestionDataSource _dataSource;

  LevelQuestionRepoImpl(this._dataSource);

  @override
  Future<ApiResult<List<QuestionEntity>>> fetchLevelQuestion(int subCategoryId) {
    return _dataSource.fetchLevelQuestion(subCategoryId);
  }
}

@injectable
class UpdateUserLevelRepo {
  final UpdateUserLevelDataSource _dataSource;

  UpdateUserLevelRepo(this._dataSource);

  Future<ApiResult<UpdateUserLevelResponse>> updateUserLevel(
    String level,
  ) async {
    try {
      final response = await _dataSource.updateUserLevel(level);
      return ApiSuccessResult(response);
    } on DioException catch (error) {
      return ApiErrorResult(
        failures: ServerError(errorMessage: error.message ?? ''),
      );
    }
  }
  Future<ApiResult<QuestionResponse>> getLevelingQuestion(int subCategoryId) async {
    try {
      final response = await _dataSource.getLevelingQuestion(subCategoryId);
      return ApiSuccessResult(response);
    } on DioException catch (error) {
      return ApiErrorResult(
        failures: ServerError(errorMessage: error.message ?? ''),
      );
    }
  }
}
