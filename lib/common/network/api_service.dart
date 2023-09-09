import 'package:dio/dio.dart';

/// сервис для авторизованной зоны
class AuthorizedApiService {
  AuthorizedApiService(this._httpClient);

  final Dio _httpClient;

  Future<Response> getClassLib(param) async {
    return _httpClient.post<dynamic>(
      'get-book-by-class/',
      data: param,
    );
  }

  Future<Response> getSynthesisAudio({required FormData param}) async {
    return _httpClient.post<dynamic>(
      'tts/',
      data: param,
      options: Options(
        followRedirects: false,
        responseType: ResponseType.bytes,
        sendTimeout: const Duration(minutes: 5),
        receiveTimeout: const Duration(minutes: 5),
      ),
    );
  }
}

/// сервис для неавторизованной зоны
class ApiService {
  ApiService(this._httpClient);

  final Dio _httpClient;

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
