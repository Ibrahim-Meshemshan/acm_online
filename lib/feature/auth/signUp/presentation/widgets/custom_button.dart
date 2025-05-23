import 'package:acm_online/core/app_colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomButton extends StatelessWidget {
  void Function() onPressed;
  String text;
  Color? backgroundColor;

  CustomButton(
      {required this.onPressed, required this.text, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
              padding: EdgeInsets.all(12.sp),
            ),
            onPressed: onPressed,
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.white)
            ),
          ),
        ),
      ],
    );
  }
}