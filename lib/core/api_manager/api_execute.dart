import '../exceptions/exceptions_impl.dart';
import '../models/erorr_data.dart';
import '../models/result.dart';
import 'package:dio/dio.dart';

class ApiExecute {
  static Future<ApiResult<T>> executeApi<T>(Future<T> Function() apiCall) async {
    try {
      var result = await apiCall.call();
      return ApiSuccess(result);
    } on DioException catch (ex) {
      switch (ex.type) {
        case DioExceptionType.badCertificate:
        case DioExceptionType.connectionError:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionTimeout:
          {
            return ApiError(NetworkError("Check your internet connection"));
          }
        case DioExceptionType.badResponse:
          {
            var responseCode = ex.response?.statusCode ?? 0;
            var errorModel = ErrorModel.fromJson(ex.response?.data);
            if (responseCode >= 400 && responseCode < 500) {
              return ApiError(ClientError(errorModel: errorModel));
            }
            if (responseCode >= 500 && responseCode < 600) {
              return ApiError(ServerError(errorModel));
            }
            return ApiError(Exception("Something went wrong"));
          }
        default:
          {
            return ApiError(Exception("Something went wrong"));
          }
      }
    } on Exception catch (ex) {
      return ApiError(ex);
    }
  }
}
