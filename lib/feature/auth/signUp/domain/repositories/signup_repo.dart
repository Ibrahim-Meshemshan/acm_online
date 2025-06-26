import 'package:acm_online/core/models/result.dart';
import 'package:acm_online/feature/auth/signUp/domain/entities/signup_entity.dart';
import 'package:acm_online/feature/auth/signUp/domain/entities/signup_request_entity.dart';

abstract class SignupRepo {
  Future<ApiResult<SignupResponseEntity>> signup(SignupRequestEntity request);
}