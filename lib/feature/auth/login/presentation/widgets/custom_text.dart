import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_theme/app_theme.dart';

class CustomText extends StatelessWidget {
  CustomText({super.key,required this.topText,required this.text});
  String topText,text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          topText,
          textAlign: TextAlign.center,
          style: AppTheme.lightTheme.textTheme.titleLarge,
        ),
        15.verticalSpace,
        Text(
          textAlign: TextAlign.center,
          text,
          style: AppTheme.lightTheme.textTheme.titleMedium,
        ),
      ],
    );
  }
}
