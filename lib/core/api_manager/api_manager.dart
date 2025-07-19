import 'package:acm_online/feature/app/category/data/models/category_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../feature/app/category/data/models/sub_category_response_dto.dart';
import '../../feature/app/quiz_level/data/models/level_quesiton_dto.dart';
import '../../feature/app/resources/data/models/resources_response_dto.dart';
import '../../feature/auth/data/models/signin_response_dto.dart';
import '../../feature/auth/data/models/signup_response_dto.dart';
import 'api_constant.dart';

part 'api_manager.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;


  @POST(ApiConstant.signup)
  Future<SignupResponseDto> signup(@Body() Map<String, dynamic> signUp);

  @POST(ApiConstant.signIn)
  Future<SignInResponseDto> signIn(@Body() Map<String, dynamic> signIn);


  @GET(ApiConstant.levelQuestion)
  Future<LevelQuestionDto> fetchLevelQuestion();

  @GET(ApiConstant.category)
  Future<CategoryResponseDto> fetchCategory();

  @GET(ApiConstant.subCategory)
  Future<SubCategoryResponseDto> fetchSubCategory();

  @GET('{path}')
  Future<ResourcesResponseDto> fetchResources(@Path('path') String path,);


}
