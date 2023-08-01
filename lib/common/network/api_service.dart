import 'package:dio/dio.dart';

class ApiService {

  ApiService(this._httpClient);

  final Future<Dio> _httpClient;

  Future<Response> getClassLib(param) async {

    final client = await _httpClient;
    return client.get<dynamic>(
      '/kazlibrary/get_texts',
      queryParameters: param,
    );
  }
}