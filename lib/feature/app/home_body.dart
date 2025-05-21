import 'package:acm_online/feature/app/home/presentation/pages/home_screen.dart';
import 'package:acm_online/feature/app/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../core/app_colors/colors.dart';
import 'category/presentation/pages/category_screen.dart';
import 'leader_bord/presentation/pages/leader_board_screen.dart';

class HomeBodyScreen extends StatelessWidget {
  HomeBodyScreen({super.key});
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);
  final List<Widget> screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const LeaderBordScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, index, child) {
          return BottomNavigationBar(
            currentIndex: index,
            onTap: (newIndex) => _selectedIndex.value = newIndex,
            items: const [
              BottomNavigationBarItem(
                backgroundColor: AppColors.backgroundColor,
                icon: Icon(Icons.home, color: AppColors.secondPrimaryColor),
                activeIcon: Icon(
                    Icons.home, color: AppColors.secondPrimaryColor),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                    Icons.calendar_month, color: AppColors.secondPrimaryColor),
                activeIcon: Icon(
                  Icons.calendar_month,
                  color: AppColors.secondPrimaryColor,
                ),
                label: 'Result',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                    Icons.person_outline, color: AppColors.secondPrimaryColor),
                activeIcon: Icon(
                  Icons.person_outline,
                  color: AppColors.secondPrimaryColor,
                ),
                label: 'LeaderBord',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                    Icons.person_outline, color: AppColors.secondPrimaryColor),
                activeIcon: Icon(
                  Icons.person_outline,
                  color: AppColors.secondPrimaryColor,
                ),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: _selectedIndex,
        builder: (context, index, child) {
          return screens[index];
        },
      ),
    );
  }
}







