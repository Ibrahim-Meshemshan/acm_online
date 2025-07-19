import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/result.dart';
import '../../../../../core/utils/status.dart';
import '../../domain/entities/signin_entity.dart';
import '../../domain/entities/signin_request_entity.dart';
import '../../domain/entities/signup_entity.dart';
import '../../domain/entities/signup_request_entity.dart';
import '../../domain/use_cases/signin_use_case.dart';
import '../../domain/use_cases/signup_use_case.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.signupUseCase,required this.signInUseCase}) : super(const AuthState());

  SignupUseCase signupUseCase;
  SignInUseCase signInUseCase;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isObscurePassword = true;

  bool isObscureConfirmPassword = true;


  Future<void> signUp() async {
    emit(state.copyWith(signUpState: Status.loading));
    final signup = SignUpRequestEntity(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    ApiResult<SignupResponseEntity> result = await signupUseCase.call(signup);
    switch (result) {
      case ApiSuccess<SignupResponseEntity>():
        emit(
          state.copyWith(signupList: result.data, signUpState: Status.success),
        );
      case ApiError<SignupResponseEntity>():
        emit(
          state.copyWith(
            signInError: result.failures.toString(),
            signUpState: Status.error,
          ),
        );
    }
  }


  Future<void> signIn() async {
    emit(state.copyWith(signInState: Status.loading));
    final signIn = SignInRequestEntity(
      email: emailController.text,
      password: passwordController.text,
    );
    ApiResult<SignInResponseEntity> result = await signInUseCase.call(signIn);
    switch (result) {
      case ApiSuccess<SignInResponseEntity>():
        emit(
          state.copyWith(signInList: result.data, signInState: Status.success),
        );
      case ApiError<SignInResponseEntity>():
        emit(
          state.copyWith(
            signInError: result.failures.toString(),
            signInState: Status.error,
          ),
        );

    }
  }
}
