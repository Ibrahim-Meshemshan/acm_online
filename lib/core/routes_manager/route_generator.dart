import 'package:acm_online/core/routes_manager/routes_names.dart';
import 'package:acm_online/feature/app/category/presentation/pages/category_screen.dart';
import 'package:acm_online/feature/app/home_body.dart';
import 'package:acm_online/feature/auth/login/presentation/pages/login_screen.dart';
import 'package:acm_online/feature/auth/signUp/presentation/pages/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../feature/home_body.dart';
class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RoutesNames.signup:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case RoutesNames.login:
        return MaterialPageRoute(builder: (_) =>    LoginScreen());
      case RoutesNames.signup:
        return MaterialPageRoute(builder: (_) =>    SignupScreen());
      case RoutesNames.homeBody:
        return MaterialPageRoute(builder: (_) => HomeBodyScreen());
      case RoutesNames.category:
        return MaterialPageRoute(builder: (_) => CategoryScreen());

      default:
        return MaterialPageRoute(
          builder: (context) => HomeBodyScreen(),
          settings: settings,
        );
    }
  }
}
