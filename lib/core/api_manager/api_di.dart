import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../models/user_model.dart';
import 'api_manager.dart';

// @module
// abstract class DioInjection {
//   @Singleton()
//   Dio injectDio() {
//     var dio = Dio(
//       BaseOptions(
//         connectTimeout: Duration(seconds: 60),
//         headers: {
//           "token": UserModel.instance.token,
//           'Authorization': 'Bearer ${UserModel.instance.token}',
//         },
//       ),
//     );
//
//     return dio;
//   }
//
//   @Singleton()
//   RestClient injectRestClient(Dio dio) {
//     return RestClient(dio);
//   }
// }


@module
abstract class DioInjection {

  @Singleton()
  LogInterceptor provideLogger() {
    return LogInterceptor();
  }

  @Singleton()
  Dio provideDIO(LogInterceptor logInterceptor) {

    var dio = Dio(  BaseOptions(
      validateStatus: (_)=>true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        // 'Cache-Control': 'no-cache',
        // 'Postman-Token': '<calculated when request is sent>',
        // 'Host': '<calculated when request is sent>',
        // 'User-Agent': 'PostmanRuntime/7.44.0',
        'Accept': '*/*',
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxLCJmaXJzdG5hbWUiOiJtYXpAdXBsaW5rLmdsb2JhbCIsImxhc3RuYW1lIjoibWF6YSIsImVtYWlsIjoibWF6QHVwbGluay5nbG9iYWwiLCJyb2xlX2lkIjoxLCJwcm9maWxlX3N0YXR1cyI6Im5vcm1hbCIsInBob25lX251bWJlciI6bnVsbCwiaXNfdmVyaWZpZWQiOmZhbHNlLCJwcmVmZXJyZWRfbGFuZ3VhZ2UiOiJlbiIsInByZWZlcnJlZF9jdXJyZW5jeSI6IlVTRCIsImNyZWF0ZWRBdCI6IjIwMjUtMDYtMDNUMTM6NTI6NDEuMDAwWiIsInVwZGF0ZWRBdCI6IjIwMjUtMDYtMDNUMTk6Mjk6MTMuMDAwWiIsImxvZ19vdXRfYXQiOm51bGwsImRlbGV0ZWRBdCI6bnVsbCwibGV2ZWwiOiJiZWdpbm5lciIsInJvbGUiOnsiaWQiOjEsIm5hbWUiOiJ1c2VyIn19LCJqdGkiOiIwYWQ0MWZjNi03YmFmLTRmOTMtOWJhOS1kM2VjYWIxMzQwMGQiLCJpYXQiOjE3NDk4MjMxMTksImV4cCI6MTc4MTM4MDcxOX0.GffZ4HCejpceM0diWYgnd-mMieUbJBYgrD-vX4zOZC8'
        // 'Accept-Encoding': 'gzip, deflate, br',
        // 'Connection': 'keep-alive',
        // 'Content-Type': 'application/json',
      },
    ),);

    dio.interceptors.add(logInterceptor);
    return dio;
  }

  @Singleton()
  RestClient provideWebServices(Dio dio) {
    return RestClient(dio);
  }

}

