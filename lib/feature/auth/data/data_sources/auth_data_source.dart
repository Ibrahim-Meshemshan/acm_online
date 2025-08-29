import 'package:acm_online/core/api_manager/api_manager.dart';
import 'package:acm_online/core/models/result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/exceptions/failures.dart';
import '../../domain/entities/signin_entity.dart';
import '../../domain/entities/signin_request_entity.dart';
import '../../domain/entities/signup_entity.dart';
import '../../domain/entities/signup_request_entity.dart';
import '../models/signin_response_dto.dart';

abstract class AuthDataSource {
  Future<ApiResult<SignInResponseEntity>> signIn(SignInRequestEntity signIn);

  Future<ApiResult<SignupResponseEntity>> signUp(SignUpRequestEntity signUp);
}

@Injectable(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  final RestClient _apiClient;
  final SharedPreferences _sharedPreferences;


  AuthDataSourceImpl(this._apiClient, this._sharedPreferences);


  Future<void> _saveTokens(TokenDto? token) async {
    if (token?.accessToken != null) {
      await _sharedPreferences.setString('access_token', token!.accessToken!);
    }
    if (token?.refreshToken != null) {
      await _sharedPreferences.setString('refresh_token', token!.refreshToken!);
    }
  }

  @override
  Future<ApiResult<SignInResponseEntity>> signIn(SignInRequestEntity request) async {
    try {
      final response = await _apiClient.signIn({
        'email': request.email,
        'password': request.password,
      });


      await _saveTokens(response.token);

      return ApiSuccess(response.toSignInResponseEntity());
    } on DioException catch (errorMessage) {
      return ApiError(failures: NetworkError(errorMessage: errorMessage.message ?? 'An unknown error occurred.'));
    }
  }

  @override
  Future<ApiResult<SignupResponseEntity>> signUp(SignUpRequestEntity signUp) async {
    try {
      final response = await _apiClient.signup({
        'email': signUp.email,
        'password': signUp.password,
        'firstname': signUp.firstName,
        'lastname': signUp.lastName,
      });
      return ApiSuccess(response.toEntity());
    } on DioException catch (errorMessage) {
      return ApiError(failures: NetworkError(errorMessage: errorMessage.message ?? 'An unknown error occurred.'));
    }
  }
}

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}