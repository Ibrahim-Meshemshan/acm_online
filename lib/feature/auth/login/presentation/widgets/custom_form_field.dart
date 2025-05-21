import 'package:flutter/material.dart';

import '../../../../../core/app_colors/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconButton? icon;
  final TextEditingController controller;
  final AutovalidateMode? autoValidateMode;
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
    this.autoValidateMode,
    this.readOnly = false,
    required this.labelText,
    required this.hintText,
    required this.keyboardType,
    this.icon,
    this.isObscure = false,
    required this.controller,
    required this.validator,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      autovalidateMode: autoValidateMode ?? AutovalidateMode.onUserInteraction,
      readOnly: readOnly,
      // autofocus: autoFocus,
      onChanged: onChanged,
      cursorColor: Colors.white,
      keyboardType: keyboardType,
      obscureText: isObscure,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        suffix: suffix,
        labelText: labelText,
        hintText: hintText,
        hintStyle:  TextStyle(
          fontSize: 14,
          color: Colors.grey[500],
          fontWeight: FontWeight.w400
        ),
        labelStyle: const TextStyle(color: Colors.white),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true,

        fillColor: AppColors.backgroundColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.greyColor),
        ),
        suffixIcon: icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}