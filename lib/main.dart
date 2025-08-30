import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/api_manager/server_dio.dart';
import 'core/app_theme/app_theme.dart';
import 'core/di/di.dart';
import 'core/routes_manager/route_generator.dart';
import 'core/storage/sharedprefrencec_helper.dart';
import 'feature/app/levels/presentation/cubit/resources_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await SharedPreferencesHelper.init();
  ServerDio.initDio();
  runApp(MultiBlocProvider(

      providers: [
        BlocProvider(create: (context) => getIt<ResourcesCubit>())
      ],
      child: const AcmOnline()));
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
          onGenerateRoute: RouteGenerator.generateRoutes,
        );
      },
    );
  }
}
//'beginner','intermediate','advanced'