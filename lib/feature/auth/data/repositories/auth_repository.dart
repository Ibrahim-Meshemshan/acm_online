import 'dart:developer';

import 'package:acm_online/core/storage/sharedprefrencec_helper.dart';
import 'package:acm_online/feature/auth/data/models/login_response_model.dart';
import 'package:acm_online/feature/auth/data/models/logout_model.dart';
import 'package:acm_online/feature/auth/domain/entities/signup_request_entity.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api_manager/api_error_handler.dart';
import '../../../../core/exceptions/failures.dart';
import '../../../../core/models/result.dart';
import '../../domain/entities/signin_request_entity.dart';
import '../data_sources/auth_data_source.dart';
import '../models/auth_me_response_model.dart';
import '../models/register_response-mdoel.dart';

@injectable
class AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepository(this._authDataSource);

  /// login

  Future<ApiResult<LoginResponseModel>> login(
    SignInRequestEntity request,
  ) async {
    try {
      final response = await _authDataSource.login(request);

      await SharedPreferencesHelper.saveToken(response.token.accessToken);
      await SharedPreferencesHelper.saveRefreshToken(
        response.token.refreshToken,
      );

      log('save login token successfully');
      log('access token is: ${SharedPreferencesHelper.getToken()}');
      log('refresh token is: ${SharedPreferencesHelper.getRefreshToken()}');

      return ApiSuccessResult(response);
    } on DioException catch (errorMessage) {
      return ApiErrorResult(
        failures: ApiError.handle(errorMessage),
      );
    }
  }

  // register

  Future<ApiResult<RegisterResponseModel>> register(SignUpRequestEntity request) async {
    try {
      final response = await _authDataSource.register(request);

      await SharedPreferencesHelper.saveToken(response.token.accessToken);
      await SharedPreferencesHelper.saveRefreshToken(
        response.token.refreshToken,
      );
      log('save register token successfully');
      log('access token is: ${SharedPreferencesHelper.getToken()}');
      log('refresh token is: ${SharedPreferencesHelper.getRefreshToken()}');
      return ApiSuccessResult(response);
    } on DioException catch (errorMessage) {
      return ApiErrorResult(
        failures: ServerError(errorMessage: errorMessage.message ?? ''),
      );
    }
  }

  Future<ApiResult<Logout>> logout(String refreshToken) async {
    try {
      final response = await _authDataSource.logout(refreshToken);

      await SharedPreferencesHelper.removeRefreshToken();

      log('refresh token is: ${SharedPreferencesHelper.getRefreshToken()}');
      return ApiSuccessResult(response);
    } on DioException catch (errorMessage) {
      return ApiErrorResult(
        failures: ServerError(errorMessage: errorMessage.message ?? ''),
      );
    }
  }

  Future<ApiResult<AuthMeResponseModel>> getAuthMe() async {
    try {
      final response = await _authDataSource.getAuthMe();
      return ApiSuccessResult(response);
    } on DioException catch (errorMessage) {
      return ApiErrorResult(
        failures: ServerError(errorMessage: errorMessage.message ?? ''),
      );
    }
  }
}
