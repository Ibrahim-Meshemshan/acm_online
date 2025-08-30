import 'package:acm_online/feature/app/home/presentation/pages/home_screen.dart';
import 'package:acm_online/feature/app/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/app_colors/colors.dart';
import '../../core/di/di.dart';
import 'category/presentation/pages/category_screen.dart';
import 'leader_board/presentation/leader_board_screen.dart';
import 'levels/presentation/cubit/resources_cubit.dart';
import 'levels/presentation/pages/resources_screen.dart';

class HomeBodyScreen extends StatelessWidget {
  HomeBodyScreen({super.key});
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);
  final List<Widget> screens = [
    const HomeScreen(),
    const CategoryScreen(),
    BlocProvider(
        create: (context) => getIt<ResourcesCubit>(),
        child: const ResourcesScreen()),
    const LeaderBoardScreen(),
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
                icon: Icon(Icons.home, color: AppColors.primaryColor),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.bars, color: AppColors.primaryColor,),

                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.book, color: AppColors.primaryColor,),

                label: 'Levels',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.award, color: AppColors.primaryColor,),

                label: 'Leader Board',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                    Icons.person_outline, color: AppColors.primaryColor),

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







