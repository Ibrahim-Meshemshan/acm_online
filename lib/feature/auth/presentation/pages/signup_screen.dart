import 'package:acm_online/core/di/di.dart';
import 'package:acm_online/core/routes_manager/routes_names.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_consts/app_validators.dart';
import '../../../../core/app_colors/colors.dart';
import '../../../../core/app_theme/app_theme.dart';
import '../../../../core/utils/dialog_utils.dart';
import '../../../../core/utils/status.dart';
import '../../../../core/widget/custom_app_bar.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_form_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Builder(
        builder: (context) {
          final viewModel = context.read<AuthCubit>();
          return Scaffold(
            appBar: CustomAppBar(title: 'Signup Screen'),
            body: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state.signUpState == Status.loading) {
                  DialogUtils.showLoading(context, 'Loading ...');
                } else {
                  DialogUtils.hideLoading(context);
                  if (state.signUpState == Status.error) {
                    DialogUtils.showError(context, state.signUpError ?? 'Unexpected error');
                  } else if (state.signUpState == Status.success) {
                    DialogUtils.showSuccess(context, "Operation completed successfully",);
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, RoutesNames.homeBody);
                  }
                }
              },
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: Form(
                  key: viewModel.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        50.verticalSpace,
                        CustomTextFormField(
                          readOnly: false,
                          controller: viewModel.firstNameController,
                          labelText: 'first name',
                          hintText: 'first name',
                          keyboardType: TextInputType.name,
                          validator:
                              (value) => AppValidators.validateFullName(value),
                        ),
                        30.verticalSpace,
                        CustomTextFormField(
                          readOnly: false,
                          controller: viewModel.lastNameController,
                          labelText: 'last name',
                          hintText: 'last name',
                          keyboardType: TextInputType.name,
                          validator:
                              (value) => AppValidators.validateFullName(value),
                        ),
                        30.verticalSpace,
                        CustomTextFormField(
                          readOnly: false,
                          controller: viewModel.emailController,
                          labelText: 'email',
                          hintText: 'enter your email',
                          keyboardType: TextInputType.emailAddress,
                          validator:
                              (value) => AppValidators.validateEmail(value),
                        ),
                        30.verticalSpace,
                        CustomTextFormField(
                          readOnly: false,
                          controller: viewModel.passwordController,
                          labelText: 'password',
                          hintText: 'enter your password',
                          keyboardType: TextInputType.visiblePassword,
                          isObscure: viewModel.isObscurePassword,
                          icon: IconButton(
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                viewModel.isObscurePassword =
                                !viewModel.isObscurePassword;
                              });
                            },
                            icon: Icon(
                              viewModel.isObscurePassword
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                            ),
                          ),
                          validator:
                              (value) => AppValidators.validatePassword(value),
                        ),
                        30.verticalSpace,
                        CustomButton(
                          onPressed: () {
                            if (viewModel.formKey.currentState!.validate()) {
                              viewModel.register();
                            }
                          },
                          text: 'Sign_up',
                        ),
                        40.verticalSpace,
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: AppTheme.lightTheme.textTheme.titleMedium,
                            children: [
                              const TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(fontSize: 16),
                              ),
                              TextSpan(
                                text: "Login",
                                style: AppTheme.lightTheme.textTheme.titleMedium
                                    ?.copyWith(
                                      color: AppColors.primaryColor,
                                      fontSize: 16,
                                    ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(
                                          context,
                                          RoutesNames.login,
                                        );
                                      },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
