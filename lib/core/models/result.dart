sealed class ApiResult<T> {}

class ApiSuccess<T> extends ApiResult<T> {
  T? data;

  ApiSuccess(this.data);
}

class ApiError<T> extends ApiResult<T> {
  Exception? exception;

  ApiError(this.exception);
}
