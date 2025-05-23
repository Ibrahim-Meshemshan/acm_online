import 'package:acm_online/core/app_theme/app_theme.dart';
import 'package:acm_online/core/routes_manager/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_colors/colors.dart';
import '../../../../../core/app_consts/app_validators.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/custom_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                topText: 'Login',
                text: "Enter your credentials to access your account",
              ),
              60.verticalSpace,
              CustomTextFormField(
                labelText: 'Email',
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                validator: (value) => AppValidators.validateEmail(value),
              ),
              30.verticalSpace,
              CustomTextFormField(
                labelText: 'Password',
                hintText: 'Enter your password',
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                validator: (value) => AppValidators.validatePassword(value),
              ),
              35.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            //TODO: login function

                            // transfer to remove until
                            Navigator.pushNamed(context, RoutesNames.homeBody);
                          }
                        },
                        child: Text('Login',
                          style: AppTheme.lightTheme.textTheme.titleMedium,)),
                  ),
                ],
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: AppTheme.lightTheme.textTheme.titleMedium,),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context,RoutesNames.signup);
                    },
                    child: Text(
                      "Signup",
                      style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                        color: AppColors.primaryColor
                      ),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
