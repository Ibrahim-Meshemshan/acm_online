import 'package:acm_online/feature/app/home/presentation/pages/home_screen.dart';
import 'package:acm_online/feature/app/profile/presentation/cubit/profile_cubit.dart';
import 'package:acm_online/feature/app/profile/presentation/pages/profile_screen.dart';
import 'package:acm_online/feature/app/quiz_level/presentation/cubit/update_user_level_cubit.dart';
import 'package:acm_online/feature/app/resources/presentation/cubit/resources_cubit.dart';
import 'package:acm_online/feature/app/resources/presentation/pages/resources_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/app_colors/colors.dart';
import '../../core/di/di.dart';
import 'category/presentation/pages/category_screen.dart';
import 'leader_board/presentation/page/leader_board_screen.dart';


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
    BlocProvider(
        create: (context) => getIt<ProfileCubit>()..getResources(),
        child: const ProfileScreen())
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
                backgroundColor: AppColors.backgroundColor,
                icon: FaIcon(
                  FontAwesomeIcons.bars, color: AppColors.primaryColor,),

                label: 'Category',
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.backgroundColor,
                icon: FaIcon(
                  FontAwesomeIcons.book, color: AppColors.primaryColor,),

                label: 'Resources',
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.backgroundColor,
                icon: FaIcon(
                  FontAwesomeIcons.award, color: AppColors.primaryColor,),

                label: 'Leader Board',
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.backgroundColor,
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







