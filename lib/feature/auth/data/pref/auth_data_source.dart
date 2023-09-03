import 'package:aizere_app/common/constants/global_pref_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<bool> removeToken() async {
    final prefs = await _sharedPreferences;

    return await prefs.remove(GlobalPrefConstant.prefAccessToken);
  }
}
