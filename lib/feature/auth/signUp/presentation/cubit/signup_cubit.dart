import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/models/result.dart';
import '../../../../../core/utils/status.dart';
import '../../domain/entities/signup_entity.dart';
import '../../domain/entities/signup_request_entity.dart';
import '../../domain/use_cases/signup_use_case.dart';

part 'signup_state.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.signupUseCase}) : super(const SignupState());

  SignupUseCase signupUseCase;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isObscurePassword = true;

  bool isObscureConfirmPassword = true;

  void signup() async {
    emit(state.copyWith(signupState: Status.loading));
    final signup = SignupRequestEntity(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    ApiResult<SignupResponseEntity> result = await signupUseCase.call(signup);
    switch (result) {
      case ApiSuccess<SignupResponseEntity>():
        emit(
          state.copyWith(signupList: result.data, signupState: Status.success),
        );
      case ApiError<SignupResponseEntity>():
        emit(
          state.copyWith(
            signupError: result.exception.toString(),
            signupState: Status.error,
          ),
        );
    }
  }
}
