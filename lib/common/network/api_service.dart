import 'package:dio/dio.dart';

class ApiService {
  ApiService(this._httpClient);

  final Dio _httpClient;

  Future<Response> getClassLib(param) async {
    return _httpClient.post<dynamic>(
      '/kazlibrary/get_texts',
      data: param,
    );
  }

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
