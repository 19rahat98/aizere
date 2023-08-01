/// базовая обработка http ошибок
/// [message] тело ошибки
/// [code] http код ошибки
class HttpRequestException<T> implements Exception {
  int code;
  String? message;
  String? field;
  HttpTypeError? httpTypeError;

  factory HttpRequestException.fromJson(
    Map<String, dynamic> json,
  ) =>
      HttpRequestException(
        code: json['error']['status_code'] as int,
        message: json['error']['message'] as String?,
        field: json['error']['field'] as String?,
      );

  HttpRequestException({
    required this.code,
    this.message,
    this.field,
    this.httpTypeError,
  });
}

enum HttpTypeError {
  unknown,
  notInternetConnection,
  http,
}
