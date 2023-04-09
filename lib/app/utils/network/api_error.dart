class ApiError<T> {
  int? statusCode;
  String? errorMessage;
  T? errorBody;

  ApiError({
    this.statusCode,
    this.errorMessage,
    this.errorBody,
  });
}
