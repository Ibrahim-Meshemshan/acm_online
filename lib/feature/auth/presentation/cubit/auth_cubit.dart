import 'package:acm_online/feature/auth/data/models/login_response_model.dart';
import 'package:acm_online/feature/auth/data/models/register_response-mdoel.dart';
import 'package:acm_online/feature/auth/data/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/result.dart';
import '../../../../../core/utils/status.dart';

import '../../domain/entities/signin_request_entity.dart';
import '../../domain/entities/signup_request_entity.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(const AuthState());

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isObscurePassword = true;

  bool isObscureConfirmPassword = true;

  Future<void> register() async {
    emit(state.copyWith(signUpState: Status.loading));
    final signup = SignUpRequestEntity(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    ApiResult<RegisterResponseModel> result = await _authRepository.register(
      signup,
    );
    switch (result) {
      case ApiSuccessResult<RegisterResponseModel>():
        emit(
          state.copyWith(signupList: result.data, signUpState: Status.success),
        );
      case ApiErrorResult<RegisterResponseModel>():
        emit(
          state.copyWith(
            signInError: result.failures.errorMessage,
            signUpState: Status.error,
          ),
        );
    }
  }

  Future<void> login() async {
    emit(state.copyWith(signInState: Status.loading));
    final login = SignInRequestEntity(
      email: emailController.text,
      password: passwordController.text,
    );
    ApiResult<LoginResponseModel> result = await _authRepository.login(login);
    switch (result) {
      case ApiSuccessResult<LoginResponseModel>():
        emit(
          state.copyWith(signInList: result.data, signInState: Status.success),
        );
      case ApiErrorResult<LoginResponseModel>():
        emit(
          state.copyWith(
            signInError: result.failures.errorMessage,
            signInState: Status.error,
          ),
        );
    }
  }
}
