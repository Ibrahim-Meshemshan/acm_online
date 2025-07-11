import 'package:acm_online/core/app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routes_manager/route_generator.dart';
import 'feature/app/home_body.dart';

void main() async {
  // configureDependencies();

  runApp(const AcmOnline());
}

class AcmOnline extends StatelessWidget {
  const AcmOnline({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: HomeBodyScreen(),
          onGenerateRoute: RouteGenerator.generateRoutes,
        );
      },
    );
  }
}
