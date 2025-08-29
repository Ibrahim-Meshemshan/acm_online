import 'package:acm_online/core/models/result.dart';
import 'package:injectable/injectable.dart';

import '../entities/signup_entity.dart';
import '../entities/signup_request_entity.dart';
import '../repositories/auth_repo.dart';

@injectable
class SignupUseCase {
  AuthRepo repo;
  SignupUseCase({required this.repo});
  Future<ApiResult<SignupResponseEntity>> call(SignUpRequestEntity request) {
    return repo.signUp(request);
  }
}
