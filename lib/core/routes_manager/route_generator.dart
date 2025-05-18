
import 'package:acm_online/core/routes_manager/routes_names.dart';
import 'package:acm_online/feature/app/home_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../feature/home_body.dart';
import '../navigation_cubit/navigation_cubit.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {

      case RoutesNames.homeBody:
        return MaterialPageRoute(builder: (_) =>   HomeBodyScreen());



      default:
        return MaterialPageRoute(
          builder: (context) => LayoutView(),
          settings: settings,
        );
    }
  }
}
