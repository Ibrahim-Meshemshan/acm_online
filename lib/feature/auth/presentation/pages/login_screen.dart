import 'package:acm_online/core/routes_manager/routes_names.dart';
import 'package:acm_online/core/widget/custom_app_bar.dart';
import 'package:acm_online/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_colors/colors.dart';
import '../../../../../core/app_consts/app_validators.dart';
import '../../../../core/di/di.dart';
import '../../../../core/utils/dialog_utils.dart';
import '../../../../core/utils/status.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Builder(
        builder: (context) {
          final viewModel = context.read<AuthCubit>();
          return Scaffold(
            appBar: CustomAppBar(
                title: 'Login Screen'
            ),
            body: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state.signInState == Status.loading) {
                  DialogUtils.showLoading(context, 'Loading ...');
                } else {
                  DialogUtils.hideLoading(context);
                  if (state.signInState == Status.error) {
                    DialogUtils.showError(context, state.signInError ?? '');
                  } else if (state.signInState == Status.success) {
                    DialogUtils.showSuccess(
                      context,
                      "Operation completed successfully",
                    );
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
                        20.verticalSpace,
                        const Text(
                          textAlign: TextAlign.center,
                          'Enter your credentials to access your account',
                          style: TextStyle(fontSize: 18, color: AppColors
                              .whiteColor),),
                        SizedBox(height: 50.h),
                        CustomTextFormField(
                          readOnly: false,
                          controller: viewModel.emailController,
                          labelText: 'Email',
                          hintText: 'Enter your Email',
                          keyboardType: TextInputType.emailAddress,
                          validator:
                              (value) =>
                              AppValidators.validateEmail(value),
                        ),
                        30.verticalSpace,
                        CustomTextFormField(
                          readOnly: false,
                          controller: viewModel.passwordController,
                          labelText: 'Password',
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
                          hintText: 'Enter your password',
                          keyboardType: TextInputType.text,
                          validator: (value) =>
                              AppValidators.validatePassword(value),
                        ),
                        50.verticalSpace,
                        CustomButton(
                          onPressed: () {
                            if (viewModel.formKey.currentState!.validate()) {
                              viewModel.login();
                              // ahmedmeshan@gmail.com
                              // Ahmedmesh@123
                              //TODO: Navigator to home page
                            }
                          },
                          text: 'Login',
                        ),

                        20.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                                "Don't have account?",
                                style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 14
                                )
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  RoutesNames.signup,
                                );
                              },
                              child: const Text(
                                  'Signup',
                                  style: TextStyle(
                                      fontSize: 14, color: AppColors.primaryColor)
                              ),
                            ),
                          ],
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
