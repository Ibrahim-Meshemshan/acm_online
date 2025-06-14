import '../exceptions/failures.dart';

sealed class ApiResult<T> {}

class ApiSuccess<T> extends ApiResult<T> {
  T? data;

  ApiSuccess(this.data);
}

class ApiError<T> extends ApiResult<T> {
  Failures failures;

  ApiError({required this.failures});
}
