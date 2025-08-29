  import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../models/user_model.dart';
import 'api_manager.dart';


@module
abstract class DioInjection {

  @Singleton()
  LogInterceptor provideLogger() {
    return LogInterceptor();
  }

  @Singleton()
  Dio provideDIO(LogInterceptor logInterceptor) {
    final dio = Dio(BaseOptions(
      validateStatus: (_) => true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
      },
    ));

    dio.interceptors.add(logInterceptor);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = UserModel.instance.token;
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
    ));

    return dio;
  }

  @Singleton()
  RestClient provideWebServices(Dio dio) {
    return RestClient(dio);
  }

}


