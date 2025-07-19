import 'package:flutter/material.dart';

import '../app_colors/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
   CustomAppBar({super.key,required this.title, this.icon});

  String title;
   Widget? icon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(color: AppColors.whiteColor,fontSize: 18),
      ),
      iconTheme: const IconThemeData(color: AppColors.whiteColor),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryColor, AppColors.blackColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

   @override
   Size get preferredSize => const Size.fromHeight(60);
}
