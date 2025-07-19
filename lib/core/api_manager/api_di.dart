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
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAsImp0aSI6Ijc1ZmQxZjRiLWQ0MDMtNGY1Ny1iZTRmLWJmMTQ2N2RjY2IyNSIsImlhdCI6MTc1MTk1MDIxMSwiZXhwIjoxNzUyNTU1MDExfQ.h6nyPb0vr4Cnfv3VKL2KPPIugFmqOpUPEMQvt6d2p30'
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

