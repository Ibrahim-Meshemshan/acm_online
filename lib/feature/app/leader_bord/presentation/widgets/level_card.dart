import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/app_colors/colors.dart';
import '../../../../../core/app_theme/app_theme.dart';

class LevelCard extends StatelessWidget {
  final String levelName;
  final String description;
  final IconData icon;
  final Color iconColor;
  final bool isEnabled; // خاصية جديدة لتحديد ما إذا كانت البطاقة ممكّنة
  final VoidCallback onTap; // إضافة onTap لتكون البطاقة قابلة للنقر

  const LevelCard({
    super.key,
    required this.levelName,
    required this.description,
    required this.icon,
    required this.iconColor,
    this.isEnabled = true, // افتراضيًا، البطاقة ممكّنة
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // تمرير الـ onTap هنا
      child: Opacity(
        opacity: isEnabled ? 1.0 : 0.5, // تقليل الشفافية إذا كانت البطاقة مقفلة
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          color: AppColors.cardColor,
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 40.w,
                  color: iconColor,
                ),
                15.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        levelName,
                        style: AppTheme.lightTheme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      5.verticalSpace,
                      Text(
                        description,
                        style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                ),
                // إضافة أيقونة القفل إذا كانت البطاقة غير ممكّنة
                if (!isEnabled) ...[
                  15.horizontalSpace,
                  Icon(
                    Icons.lock,
                    size: 25.w,
                    color: AppColors.greyColor,
                  ),
                ],
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20.w,
                  color: AppColors.greyColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}