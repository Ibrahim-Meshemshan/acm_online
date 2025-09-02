import 'package:acm_online/core/api_manager/api_constant.dart';
import 'package:acm_online/core/api_manager/api_manager.dart';
import 'package:acm_online/core/api_manager/server_dio.dart';
import 'package:acm_online/core/models/result.dart';
import 'package:acm_online/feature/auth/data/models/logout_model.dart';
import 'package:acm_online/feature/auth/data/models/register_response-mdoel.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/signin_request_entity.dart';
import '../../domain/entities/signup_request_entity.dart';
import '../models/auth_me_response_model.dart';
import '../models/login_response_model.dart';

@injectable
class AuthDataSource {
  AuthDataSource();

  Future<LoginResponseModel> login(SignInRequestEntity request) async {
    final json = request.toJson();
    final response = await ServerDio.dioInstance.post(
      ApiConstant.login,
      data: json,
    );
    return LoginResponseModel.fromJson(response.data);
  }

  Future<RegisterResponseModel> register(SignUpRequestEntity signUp) async {
    final json = signUp.toJson();
    final response = await ServerDio.dioInstance.post(
      ApiConstant.signup,
      data: json,
    );
    return RegisterResponseModel.fromJson(response.data);
  }

  Future<Logout> logout(String refreshToken) async {
    final response = await ServerDio.dioInstance.post(
      ApiConstant.logout,
      data: {'refreshToken': refreshToken},
    );
    return Logout.fromJson(response.data);
  }

  Future<AuthMeResponseModel> getAuthMe() async {
    final response = await ServerDio.dioInstance.post(
      ApiConstant.authMe,
    );
    return AuthMeResponseModel.fromJson(response.data);
  }


}

// @module
// abstract class RegisterModule {
//   @preResolve
//   Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
// }
