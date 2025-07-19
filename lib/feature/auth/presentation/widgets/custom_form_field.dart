import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_colors/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconButton? icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isObscure;
  final TextInputType keyboardType;
  final Widget? suffix;
  final String labelText;
  final bool readOnly;
  final void Function(String)? onChanged;
  final bool autoFocus;

  CustomTextFormField({
    super.key,
    this.suffix,
    this.onChanged,
    this.readOnly = false,
    required this.labelText,
    required this.hintText,
    required this.keyboardType,
    this.icon,
    this.isObscure = false,
    required this.controller,
     this.validator,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.verticalSpace,
        TextFormField(
          readOnly: readOnly,
          autofocus: autoFocus,
          onChanged: onChanged,
          cursorColor: Colors.black,
          keyboardType: keyboardType,
          obscureText: isObscure,
          validator: validator,
          controller: controller,
          style: const TextStyle(fontSize: 16, color: AppColors.whiteColor),
          decoration: InputDecoration(
            suffix: suffix,
            labelText: labelText,
            hintText: hintText,
            hintStyle: const TextStyle(
                fontSize: 14,
                color: Color(0xffa6a6a6),
                fontWeight: FontWeight.w400),
            labelStyle: const TextStyle(color: Colors.white),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            filled: true,
            fillColor: AppColors.backgroundColor,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(
                  color: AppColors.primaryColor, width: 2),
            ),
            suffixIcon: icon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ],
    );
  }
}
