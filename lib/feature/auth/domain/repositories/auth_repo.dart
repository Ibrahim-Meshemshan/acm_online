import 'package:acm_online/core/models/result.dart';
import '../entities/signin_entity.dart';
import '../entities/signin_request_entity.dart';
import '../entities/signup_entity.dart';
import '../entities/signup_request_entity.dart';

abstract class AuthRepo {
  Future<ApiResult<SignInResponseEntity>> signIn(SignInRequestEntity request);
  Future<ApiResult<SignupResponseEntity>> signUp(SignUpRequestEntity request);
}