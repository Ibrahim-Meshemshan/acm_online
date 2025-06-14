import 'package:acm_online/core/routes_manager/routes_names.dart';
import 'package:acm_online/feature/app/category/presentation/pages/category_screen.dart';
import 'package:acm_online/feature/app/home_body.dart';
import 'package:acm_online/feature/app/leader_bord/presentation/pages/leader_board_screen.dart';
import 'package:acm_online/feature/app/profile/presentation/pages/profile_screen.dart';
import 'package:acm_online/feature/auth/login/presentation/pages/login_screen.dart';
import 'package:acm_online/feature/auth/signUp/presentation/pages/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../feature/app/quiz_level/presentation/pages/quiz_level_screen.dart';



class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      // case RoutesNames.signup:
      //   return MaterialPageRoute(builder: (_) =>    const SignupScreen());
      case RoutesNames.homeBody:
        return MaterialPageRoute(builder: (_) => HomeBodyScreen());
      case RoutesNames.category:
        return MaterialPageRoute(builder: (_) => const CategoryScreen());
      case RoutesNames.quizScreen:
        return MaterialPageRoute(builder: (_) => const QuizLevelScreen());
      case RoutesNames.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case RoutesNames.leaderboard:
        return MaterialPageRoute(builder: (_) => const LeaderBordScreen());

      default:
        return MaterialPageRoute(
          builder: (context) => HomeBodyScreen(),
          settings: settings,
        );
    }
  }
}
