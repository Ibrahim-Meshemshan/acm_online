// import 'dart:developer';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'api_error_model.dart';
//
// class ApiErrorHandler {
//   static ApiErrorModel handle(dynamic error) {
//     if (error is DioException) {
//       // error from client
//       switch (error.type) {
//         case DioExceptionType.connectionError:
//           return ApiErrorModel(message: 'No internet connection');
//         case DioExceptionType.cancel:
//           return ApiErrorModel(message: 'Request to the Server was cancelled');
//         case DioExceptionType.connectionTimeout:
//           return ApiErrorModel(message: 'Connection timeout with API server');
//         case DioExceptionType.sendTimeout:
//           return ApiErrorModel(
//             message: 'Send timeout in connection with API server',
//           );
//         case DioExceptionType.badResponse:
//           final statusCode = error.response?.statusCode;
//           if (statusCode == 401) {
//             return ApiErrorModel(message: 'Unauthorized');
//           } else if (statusCode == 403) {
//             return ApiErrorModel(message: 'Forbidden');
//           } else if (statusCode == 404) {
//             return ApiErrorModel(message: 'User not found');
//           } else if (statusCode == 400) {
//             return ApiErrorModel(message: 'Bad request');
//           } else if (statusCode! >= 500) {
//             return ApiErrorModel(message: 'Internal server error');
//           }
//           return _handleError(error.response?.data);
//         case DioExceptionType.receiveTimeout:
//           return ApiErrorModel(
//             message: 'Receive timeout in connection with API server',
//           );
//         case DioExceptionType.unknown:
//           log('Unknown DioError: ${error.error}');
//           return ApiErrorModel(message: 'Unknown error');
//         default:
//           return ApiErrorModel(message: 'Something went wrong');
//       }
//     } else {
//       // default error
//       if (error is FormatException) {
//         return ApiErrorModel(message: "Bad response format");
//       }
//       if (error is SocketException) {
//         return ApiErrorModel(message: 'No internet connection');
//       }
//       return ApiErrorModel(message: 'Something went wrong');
//     }
//   }
// }
//
// ApiErrorModel _handleError(dynamic data) {
//   return ApiErrorModel(
//     message: data['message'] ?? 'Something went wrong',
//     status: data['status'],
//     data: data['data'],
//   );
// }
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import '../exceptions/failures.dart';

class ApiError extends Failures {
  ApiError({required super.errorMessage});

  factory ApiError.fromDioError(DioException dioError) {
    String message;
    switch (dioError.type) {
      case DioExceptionType.connectionError:
        message = 'No internet connection';
        break;
      case DioExceptionType.cancel:
        message = 'Request to the Server was cancelled';
        break;
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;
      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;
      case DioExceptionType.badResponse:
        final statusCode = dioError.response?.statusCode;
        if (statusCode == 401) {
          message = 'Wrong password';
        } else if (statusCode == 403) {
          message = 'Forbidden';
        } else if (statusCode == 404) {
          message = 'User not found';
        } else if (statusCode == 400) {
          message = 'Bad request';
        } else if (statusCode! >= 500) {
          message = 'Internal server error';
        } else {
          message = 'Something went wrong';
        }
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;
      case DioExceptionType.unknown:
        log('Unknown DioError: ${dioError.error}');
        message = 'Unknown error';
        break;
      default:
        message = 'Something went wrong';
        break;
    }
    return ApiError(errorMessage: message);
  }

  factory ApiError.fromOtherError(dynamic error) {
    String message;
    if (error is FormatException) {
      message = "Bad response format";
    } else if (error is SocketException) {
      message = 'No internet connection';
    } else {
      message = 'Something went wrong';
    }
    return ApiError(errorMessage: message);
  }

  factory ApiError.handle(dynamic error) {
    if (error is DioException) {
      return ApiError.fromDioError(error);
    } else {
      return ApiError.fromOtherError(error);
    }
  }
}