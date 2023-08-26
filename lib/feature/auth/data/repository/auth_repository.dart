import 'dart:developer';

import 'package:aizere_app/common/network/api_service.dart';
import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/auth/data/pref/auth_data_source.dart';
import 'package:aizere_app/utils/http_call_utils.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  AuthRepository()
      : _apiService = sl(),
        _dataSource = sl();

  final ApiService _apiService;
  final AuthDataSource _dataSource;

  Future<Response> signUp(
    String username,
    String password,
    String firstName,
  ) =>
      safeApiCall(
        _apiService.signUp(
          username,
          password,
          firstName,
        ),
        (response) {
          final token = response['token'];
          _dataSource.saveToken(token);
          log(response.toString());
          return response;
        },
      );

  Future<String> emailConfirmation(
    String username,
    String code,
  ) =>
      safeApiCall(
        _apiService.emailConfirmation(
          username,
          code,
        ),
        (response) {
          final token = response['token'];
          _dataSource.saveToken(token);
          log(response.toString());
          return token;
        },
      );

  Future<String> signIn(String username, String password) async => safeApiCall(
        _apiService.signIn(username, password),
        (response) {
          log(response.toString());

          final token = response['token'];
          _dataSource.saveToken(token);
          return token;
        },
      );
}
