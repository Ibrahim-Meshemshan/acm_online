import 'package:acm_online/feature/auth/signUp/data/models/signup_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_manager.g.dart';

@RestApi(baseUrl: '')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;


  @POST('')
  Future<SignupResponseModel> signup(@Body() Map<String, dynamic> email);

}
