import 'package:flutter/material.dart';

import '../app_colors/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    primaryColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      // actionsIconTheme: IconThemeData(color: AppColors.primaryTextColor),
      titleTextStyle: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        // color: AppColors.primaryTextColor,
        fontFamily: AppColors.fontFamily,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        // color: AppColors.primaryTextColor,
        fontFamily: AppColors.fontFamily,
      ),
      titleMedium: TextStyle(
        color: Color(0xFF878787),
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: AppColors.fontFamily,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(color: AppColors.backgroundColor),
        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        )
      )
    )
  );
}
