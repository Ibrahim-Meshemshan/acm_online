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
        color: AppColors.whiteColor,
        fontFamily: AppColors.fontFamily,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: AppColors.whiteColor,
        fontFamily: AppColors.fontFamily,
      ),
      titleMedium: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: AppColors.fontFamily,
      ),
    ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor:  AppColors.primaryColor,
          foregroundColor: AppColors.whiteColor,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: AppColors.fontFamily,
          ),
        ),
      ),


      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedLabelStyle: TextStyle(color: AppColors.primaryColor)
    )
  );
}
