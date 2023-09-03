import 'package:aizere_app/common/network/api_service.dart';
import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/auth/data/pref/auth_data_source.dart';
import 'package:aizere_app/utils/exeption/exception.dart';
import 'package:aizere_app/utils/http_call_utils.dart';

class AuthRepository {
  AuthRepository()
      : _apiService = sl(),
        _dataSource = sl();

  final ApiService _apiService;
  final AuthDataSource _dataSource;

  Future<void> signUp(String username, String password, String firstName) =>
      safeApiCallWithError<void, GlobalAuthException>(
        _apiService.signUp(username, password, firstName),
        print,
        GlobalAuthException.fromJson,
      );

  Future<String> emailConfirmation(String username, String code) =>
      safeApiCallWithError<String, GlobalAuthException>(
        _apiService.emailConfirmation(username, code),
        (response) {
          final token = response['token'];
          _dataSource.saveToken(token);
          return token;
        },
        GlobalAuthException.fromJson,
      );

  Future<String> signIn(String username, String password) async =>
      safeApiCallWithError<String, GlobalAuthException>(
        _apiService.signIn(username, password),
        (response) {
          final token = response['token'];
          _dataSource.saveToken(token);
          return token;
        },
        GlobalAuthException.fromJson,
      );

  Future<bool> logOut() async => _dataSource.removeToken();
}
