// import 'package:flutter/material.dart';
//
// import '../core/app_colors/colors.dart';
//
// class LayoutView extends StatelessWidget {
//   LayoutView({super.key});
//   final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);
//   final List<Widget> _screens = [const Home(), const Category(), const LeaderBord(),const Profile()];
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Scaffold(
//       bottomNavigationBar: ValueListenableBuilder<int>(
//         valueListenable: _selectedIndex,
//         builder: (context, index, child) {
//           return BottomNavigationBar(
//             backgroundColor: AppColors.blackColor,
//             currentIndex: index,
//             onTap: (newIndex) => _selectedIndex.value = newIndex,
//             items:  const [
//               BottomNavigationBarItem(
//                 backgroundColor: AppColors.blackColor,
//                 icon: Icon(Icons.home, color: Colors.grey),
//                 activeIcon: Icon(Icons.home, color: AppColors.whiteColor),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 backgroundColor: AppColors.blackColor,
//                 icon: Icon(Icons.calendar_month, color: AppColors.whiteColor),
//                 activeIcon: Icon(
//                   Icons.calendar_month,
//                   color: AppColors.whiteColor,
//                 ),
//                 label: 'Category',
//               ),
//               BottomNavigationBarItem(
//                 backgroundColor: AppColors.blackColor,
//                 icon: Icon(Icons.person_outline, color: AppColors.whiteColor),
//                 activeIcon: Icon(
//                   Icons.person_outline,
//                   color: AppColors.whiteColor,
//                 ),
//                 label: 'LeaderBord',
//               ),
//               BottomNavigationBarItem(
//                 backgroundColor: AppColors.backgroundColor,
//                 icon: Icon(Icons.person_outline, color: AppColors.whiteColor),
//                 activeIcon: Icon(
//                   Icons.person_outline,
//                   color: AppColors.whiteColor,
//                 ),
//                 label: 'Profile',
//               ),
//             ],
//           );
//         },
//       ),
//       body: ValueListenableBuilder<int>(
//         valueListenable: _selectedIndex,
//         builder: (context, index, child) {
//           return _screens[index];
//         },
//       ),
//     );
//   }
// }
//
// class Home extends StatelessWidget {
//   const Home({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  Column(
//         children: [
//           Text("")
//         ],
//         );
//   }
// }
//
// class Category extends StatelessWidget {
//   const Category({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text("Orders"));
//   }
// }
//
// class LeaderBord extends StatelessWidget {
//   const LeaderBord({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text("LeaderBord"));
//   }
// }
//
// class Profile extends StatelessWidget {
//   const Profile({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text("Profile"));
//   }
// }
