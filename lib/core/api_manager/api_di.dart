import 'package:acm_online/core/api_manager/server_dio.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'api_manager.dart';


@module
abstract class DioInjection {
  @Singleton()
  Dio provideDIO() {
    ServerDio.initDio();
    return ServerDio.dioInstance;
  }

  @Singleton()
  RestClient provideWebServices(Dio dio) {
    return RestClient(dio);
  }
}



