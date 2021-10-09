class ApiResult {
  final int code;
  final String? error;
  final dynamic data;

  ApiResult(
    this.code,
    this.error,
    this.data,
  );
}
