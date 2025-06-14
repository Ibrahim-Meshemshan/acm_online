import 'package:acm_online/core/models/result.dart';
import 'package:acm_online/feature/auth/signUp/domain/repositories/signup_repo.dart';
import 'package:injectable/injectable.dart';

import '../entities/signup_entity.dart';
import '../entities/signup_request_entity.dart';

@injectable
class SignupUseCase {
  SignupRepo repo;
  SignupUseCase({required this.repo});
  Future<ApiResult<SignupResponseEntity>> call(SignupRequestEntity request) {
    return repo.signup(request);
  }
}
