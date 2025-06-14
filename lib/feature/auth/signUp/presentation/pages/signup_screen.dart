// import 'package:acm_online/core/di/di.dart';
// import 'package:acm_online/core/routes_manager/routes_names.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../../core/app_consts/app_validators.dart';
// import '../../../login/presentation/widgets/custom_form_field.dart';
// import '../cubit/signup_cubit.dart';
// import '../widgets/custom_button.dart';
//
// class SignupScreen extends StatelessWidget {
//   const SignupScreen({super.key});
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt<SignupCubit>(),
//       child: BlocBuilder<SignupCubit, SignupState>(
//         builder: (context, state) {
//           final SignupCubit viewModel = context.read<SignupCubit>();
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text('Register'),
//               leading: const SizedBox(),
//             ),
//             body: Padding(
//               padding: EdgeInsets.all(16.sp),
//               child: Form(
//                 key: viewModel.formKey,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       50.verticalSpace,
//                       CustomTextFormField(
//                         readOnly: false,
//                         controller: viewModel.firstNameController,
//                         labelText: 'first name',
//                         hintText: 'first name',
//                         keyboardType: TextInputType.name,
//                         validator:
//                             (value) =>
//                             AppValidators.validateFullName(value),
//                       ),
//                       30.verticalSpace,
//                       CustomTextFormField(
//                         readOnly: false,
//                         controller: viewModel.lastNameController,
//                         labelText: 'last name',
//                         hintText: 'last name',
//                         keyboardType: TextInputType.name,
//                         validator:
//                             (value) => AppValidators.validateFullName(value),
//                       ),
//                       30.verticalSpace,
//                       CustomTextFormField(
//                         readOnly: false,
//                         controller: viewModel.emailController,
//                         labelText: 'email',
//                         hintText: 'enter your email',
//                         keyboardType: TextInputType.emailAddress,
//                         validator:
//                             (value) =>
//                             AppValidators.validateEmail(value),
//                       ),
//                       30.verticalSpace,
//                       CustomTextFormField(
//                         readOnly: false,
//                         controller: viewModel.passwordController,
//                         labelText: 'password',
//                         hintText: 'enter your password',
//                         keyboardType: TextInputType.visiblePassword,
//                         validator:
//                             (value) =>
//                             AppValidators.validatePassword(value),
//                       ),
//
//                       30.verticalSpace,
//                       CustomButton(
//                         onPressed: () {
//                           if (viewModel.formKey.currentState!.validate()) {
//                             // viewModel.signup();
//                             // //TODO: Navigator to home page
//                             Navigator.pushNamed(context, RoutesNames.homeBody);
//                           }
//                         },
//                         text: 'Sign_up',
//                       ),
//
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
