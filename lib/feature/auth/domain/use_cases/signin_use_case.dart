import 'package:injectable/injectable.dart';
import '../../../../../core/models/result.dart';
import '../entities/signin_entity.dart';
import '../entities/signin_request_entity.dart';
import '../repositories/auth_repo.dart';

@injectable
class SignInUseCase {
  AuthRepo repo;
  SignInUseCase({required this.repo});
  Future<ApiResult<SignInResponseEntity>> call(SignInRequestEntity signup) {
    return repo.signIn(signup);
  }
}
