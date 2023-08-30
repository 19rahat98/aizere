import 'package:dio/dio.dart';

class ApiService {
  ApiService(this._httpClient);

  /// Библиотека которая позволяет нам кидать http запросы
  final Dio _httpClient;

  Future<Response> getClassLib(param) async {
    return _httpClient.post<dynamic>(
      '/kazlibrary/get_texts',
      data: param,
    );
  }

  /// Метод для отправки данных пользователя и кода подтверждения, чтобы в дальнейшем подтвердить код и зарегистрироваться
  Future<Response> signUp(
    String username,
    String password,
    String firstName,
  ) async {
    return _httpClient.post(
      'auth/register/',
      data: {
        "username": username,
        "password": password,
        "first_name": firstName,
      },
    );
  }

  /// Метод для проверки полученного кода.
  Future<Response> emailConfirmation(String username, String code) {
    return _httpClient.post(
      'mail-code/',
      data: {
        'username': username,
        'code': code,
      },
    );
  }

  Future<Response> signIn(String username, String password) {
    return _httpClient.post(
      'auth/login/',
      data: {
        'username': username,
        'password': password,
      },
    );
  }
}
