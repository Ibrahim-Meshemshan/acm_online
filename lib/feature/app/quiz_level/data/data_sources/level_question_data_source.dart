import 'package:acm_online/core/models/result.dart';
import 'package:acm_online/feature/app/quiz_level/data/models/update_user_level_response_model.dart';
import 'package:acm_online/feature/app/quiz_level/domain/entities/level_question_entity.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/api_manager/api_constant.dart';
import '../../../../../core/api_manager/api_manager.dart';
import '../../../../../core/api_manager/server_dio.dart';
import '../../../../../core/exceptions/failures.dart';
import '../models/level_quesiton_dto.dart';

abstract class LevelQuestionDataSource {
  Future<ApiResult<List<QuestionEntity>>> fetchLevelQuestion(int subCategoryId);
}

@Injectable(as: LevelQuestionDataSource)
class LevelQuestionDataSourceImpl implements LevelQuestionDataSource {
  final RestClient _apiClient;

  LevelQuestionDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<List<QuestionEntity>>> fetchLevelQuestion(int subCategoryId) async {
    try {
      final response = await _apiClient.fetchLevelQuestion();
      return ApiSuccessResult(
        response.data?.map((dto) => dto.toQuestionEntity()).toList() ?? [],
      );
    } on DioException catch (errorMessage) {
      return ApiErrorResult(
        failures: NetworkError(errorMessage: errorMessage.message ?? ''),
      );
    }
  }
}

@singleton
class UpdateUserLevelDataSource {
  Future<UpdateUserLevelResponse> updateUserLevel(String level) async {
    final response = await ServerDio.dioInstance.put(
      ApiConstant.userLevel,
      data: {'level': level},
    );
    return UpdateUserLevelResponse.fromJson(response.data);
  }

  Future<QuestionResponse> getLevelingQuestion(int subCategoryId) async {
    final response = await ServerDio.dioInstance.get(
      ApiConstant.levelingQuestion,
      queryParameters: {
        'subCategoryId': subCategoryId,
        'questionCount': 10,
        'difficulty': 'easy',

      },
    );
    return QuestionResponse.fromJson(response.data);
  }
}
