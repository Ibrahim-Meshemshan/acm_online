import 'package:acm_online/core/routes_manager/routes_names.dart';
import 'package:acm_online/feature/app/category/presentation/pages/category_screen.dart';
import 'package:acm_online/feature/app/category/presentation/pages/sub_category_screen.dart';
import 'package:acm_online/feature/app/home_body.dart';
import 'package:acm_online/feature/app/leader_bord/presentation/pages/levels_screen.dart';
import 'package:acm_online/feature/app/profile/presentation/pages/profile_screen.dart';
import 'package:acm_online/feature/root/onboarding/onboarding_screen.dart';
import 'package:acm_online/feature/root/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../feature/app/quiz_level/presentation/pages/quiz_level_screen.dart';
import '../../feature/app/resources/presentation/pages/resources_screen.dart';
import '../../feature/auth/presentation/pages/login_screen.dart';
import '../../feature/auth/presentation/pages/signup_screen.dart';



class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesNames.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case RoutesNames.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesNames.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case RoutesNames.homeBody:
        return MaterialPageRoute(builder: (_) => HomeBodyScreen());
      case RoutesNames.category:
        return MaterialPageRoute(builder: (_) => const CategoryScreen());
      case RoutesNames.subCategory:
        return MaterialPageRoute(builder: (_) => const SubCategoryScreen());
      case RoutesNames.quizScreen:
        return MaterialPageRoute(builder: (_) => const QuizLevelScreen());
      case RoutesNames.resources:
        return MaterialPageRoute(builder: (_) => const ResourcesScreen());

      case RoutesNames.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case RoutesNames.levels:
        return MaterialPageRoute(builder: (_) => const LevelsScreen());
      // case RoutesNames.levelDetails:
      //   return MaterialPageRoute(builder: (_) => const LevelsScreen());

      default:
        return MaterialPageRoute(
          builder: (context) =>
          const Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: Text('No Screen found '),),
          ),
          settings: settings,
        );
    }
  }
}
