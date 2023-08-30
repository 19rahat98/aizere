import 'package:aizere_app/common/constants/global_pref_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// класс нужен для функций сохранения токена после авторизации и регистрации
class AuthDataSource {
  const AuthDataSource(this._sharedPreferences);

  final Future<SharedPreferences> _sharedPreferences;

  Future<void> saveToken(String token) async {
    final prefs = await _sharedPreferences;

    await prefs.setString(GlobalPrefConstant.prefAccessToken, token);
  }

  Future<String?> get token async {
    final prefs = await _sharedPreferences;
    return prefs.getString(GlobalPrefConstant.prefAccessToken);
  }
}
