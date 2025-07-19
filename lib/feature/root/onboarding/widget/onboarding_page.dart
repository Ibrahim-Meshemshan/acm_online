import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_colors/colors.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({
    super.key,
    required this.description,
    required this.title,
    required this.image,
  });

  IconData image;
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(image, size: 150.sp, color: AppColors.secondPrimaryColor),
          50.verticalSpace,
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
          20.verticalSpace,
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.sp, color: AppColors.greyColor),
          ),
        ],
      ),
    );
  }
}
