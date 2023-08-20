import 'dart:developer';

import 'package:aizere_app/common/network/api_service.dart';
import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/auth/data/pref/auth_data_source.dart';
import 'package:aizere_app/utils/http_call_utils.dart';

class AuthRepository {
  AuthRepository()
      : _apiService = sl(),
        _dataSource = sl();

  final ApiService _apiService;
  final AuthDataSource _dataSource;

  Future<void> signUp(
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
          log(response.toString());
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
