import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../feature/app/quiz_level/data/models/level_quesiton_dto.dart';
import 'api_constant.dart';

part 'api_manager.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;





  @GET(ApiConstant.levelQuestion)
  Future<LevelQuestionDto> fetchLevelQuestion();





}
