import 'package:acm_online/feature/app/category/data/models/category_response_dto.dart';
import 'package:acm_online/feature/auth/signUp/data/models/signup_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../feature/app/quiz_level/data/models/level_quesiton_dto.dart';
import 'api_constant.dart';

part 'api_manager.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;


  @POST('')
  Future<SignupResponseModel> signup(@Body() Map<String, dynamic> email);


  @GET(ApiConstant.levelQuestion)
  Future<LevelQuestionDto> fetchLevelQuestion();

  @GET(ApiConstant.category)
  Future<CategoryResponseDto> fetchCategory();

}
