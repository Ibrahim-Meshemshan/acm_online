import 'package:acm_online/core/models/result.dart';
import 'package:acm_online/feature/app/quiz_level/domain/entities/level_question_entity.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/api_manager/api_manager.dart';
import '../../../../../core/exceptions/failures.dart';

abstract class LevelQuestionDataSource {
  Future<ApiResult<List<QuestionEntity>>> fetchLevelQuestion();
}


@Injectable(as: LevelQuestionDataSource)
class LevelQuestionDataSourceImpl implements LevelQuestionDataSource{

  final RestClient _apiClient;
  LevelQuestionDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<List<QuestionEntity>>> fetchLevelQuestion() async{
    try {
      final response = await _apiClient.fetchLevelQuestion();
      return ApiSuccessResult(response.data?.map((dto)=>dto.toQuestionEntity()).toList() ?? []);
    } on DioException catch (errorMessage) {
      return ApiErrorResult(failures: NetworkError(errorMessage: errorMessage.message ?? '',));
    }
  }

}