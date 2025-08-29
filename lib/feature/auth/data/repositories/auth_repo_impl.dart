import 'package:acm_online/core/models/result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/signin_entity.dart';
import '../../domain/entities/signin_request_entity.dart';
import '../../domain/entities/signup_entity.dart';
import '../../domain/entities/signup_request_entity.dart';
import '../../domain/repositories/auth_repo.dart';
import '../data_sources/auth_data_source.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthDataSource _dataSource;

  AuthRepoImpl(this._dataSource);

  @override
  Future<ApiResult<SignInResponseEntity>> signIn(
    SignInRequestEntity signIn,
  ) async {
    return await _dataSource.signIn(signIn);
  }

  @override
  Future<ApiResult<SignupResponseEntity>> signUp(
    SignUpRequestEntity signUp,
  ) async {
    return await _dataSource.signUp(signUp);
  }
}


