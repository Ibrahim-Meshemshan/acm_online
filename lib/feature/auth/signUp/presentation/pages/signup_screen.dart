
import 'package:acm_online/core/app_colors/colors.dart';
import 'package:acm_online/core/routes_manager/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_consts/app_validators.dart';
import '../../../../../core/utils/status.dart';
import '../cubit/signup_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/custom_text.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    // final viewModel = context.read<SignupCubit>();
    return  Scaffold(
          appBar: AppBar(
            title: const Text("Signup Screen"),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Form(
              // key: viewModel.formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            readOnly: false,
                            controller: TextEditingController(),
                            labelText: '',
                            hintText: '',
                            keyboardType: TextInputType.text,
                            validator:
                                (value) =>
                                AppValidators.validateFullName(value),
                          ),
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: CustomTextFormField(
                            readOnly: false,
                            controller: TextEditingController(),
                            labelText: '',
                            hintText: '',
                            keyboardType: TextInputType.text,
                            validator:
                                (value) =>
                                AppValidators.validateFullName(value),
                          ),
                        ),
                      ],
                    ),
                    15.verticalSpace,
                    CustomTextFormField(
                      readOnly: false,
                      controller: TextEditingController(),
                      labelText: '',
                      hintText: '',
                      keyboardType: TextInputType.emailAddress,
                      validator:
                          (value) => AppValidators.validateEmail(value),
                    ),
                    15.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            readOnly: false,
                            controller: TextEditingController(),
                            labelText: '',
                            hintText: '',
                            // isObscure: viewModel.isObscurePassword,
                            keyboardType: TextInputType.visiblePassword,
                            // icon: IconButton(
                            //   onPressed: () {
                            //     // setState(() {
                            //     //   viewModel.isObscurePassword =
                            //     //   !viewModel.isObscurePassword;
                            //     // });
                            //   },
                            //   icon: Icon(
                            //     viewModel.isObscurePassword
                            //         ? Icons.visibility_off_rounded
                            //         : Icons.visibility_rounded,
                            //   ),
                            // ),
                            validator:
                                (value) =>
                                AppValidators.validatePassword(value),
                          ),
                        ),
                        10.horizontalSpace,

                      ],
                    ),
                    // CustomTextFormField(
                    //   readOnly: false,
                    //   controller: viewModel.phoneController,
                    //   labelText: lang.phoneNumber,
                    //   hintText: lang.enterPhoneNumber,
                    //   keyboardType: TextInputType.phone,
                    //   validator:
                    //       (value) =>
                    //       AppValidators.validatePhoneNumber(value),
                    // ),
                    // 20.verticalSpace,
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //       lang.gender,
                    //       style: const TextStyle(
                    //         fontWeight: FontWeight.w500,
                    //         fontSize: 18,
                    //         color: Color(0xff535353),
                    //       ),
                    //     ),
                    //     SizedBox(width: 20.w),
                    //     IntrinsicWidth(
                    //       child: Row(
                    //         children: [
                    //           Radio<String>(
                    //             activeColor: ColorManager.appColor,
                    //             value: "male",
                    //             groupValue: viewModel.genderController.text,
                    //             onChanged: (value) {
                    //               setState(() {
                    //                 viewModel.genderController.text =
                    //                 value!;
                    //               });
                    //             },
                    //           ),
                    //           Text(
                    //             lang.male,
                    //             style: const TextStyle(fontSize: 16),
                    //           ),
                    //           SizedBox(width: 20.w),
                    //           Radio<String>(
                    //             activeColor: ColorManager.appColor,
                    //             value: "female",
                    //             groupValue: viewModel.genderController.text,
                    //             onChanged: (value) {
                    //               setState(() {
                    //                 viewModel.genderController.text =
                    //                 value!;
                    //               });
                    //             },
                    //           ),
                    //           Text(
                    //             lang.female,
                    //             style: const TextStyle(fontSize: 16),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    20.verticalSpace,
                    const Row(
                      children: [
                        // Text(
                        //   lang.termsAndConditionsNotice,
                        //   style: const TextStyle(
                        //     fontSize: 12,
                        //     fontWeight: FontWeight.w400,
                        //   ),
                        // ),
                        // GestureDetector(
                        //   onTap: (){
                        //     // Navigator.pushNamed(context, Routes.termsConditions);
                        //   },
                        //   child: Text(
                        //     lang.termsAndConditions,
                        //     style: const TextStyle(
                        //       decoration: TextDecoration.underline,
                        //       decorationColor: Colors.black,
                        //       decorationThickness: 3,
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 12,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    30.verticalSpace,
                    // CustomButton(
                    //   onPressed: () {
                    //   //   if (viewModel.formKey.currentState!.validate()) {
                    //   //     // viewModel.signup();
                    //   //     //TODO: Navigator to home page
                    //   //   }
                    //   // },
                    //   text: 'signUp',
                    // ),
                    15.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'already have account',
                          style: TextStyle(fontSize: 16),
                        ),
                        CustomText(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, RoutesNames.login);
                          },
                          child: const Text(
                            'login',
                            style:  TextStyle(
                              decoration: TextDecoration.underline,
                              decorationThickness: 2,
                              decorationColor: AppColors.primaryColor,
                              color: AppColors.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );


  }
}
