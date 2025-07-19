import 'package:flutter/material.dart';

import '../../../../../core/app_colors/colors.dart';

class SubCategoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const SubCategoryCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 28, // Roughly half screen width minus padding/spacing
        height: 120, // Fixed height for consistency
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.secondPrimaryColor : AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: isSelected ? Border.all(color: AppColors.secondPrimaryColor, width: 2) : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute space
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: isSelected ? AppColors.whiteColor : AppColors.whiteColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: isSelected ? AppColors.whiteColor.withOpacity(0.8) : AppColors.secondPrimaryColor,
                fontSize: 16,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}