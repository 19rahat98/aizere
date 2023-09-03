import 'package:aizere_app/common/constants/global_pref_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// data source для работы с типом календаря и шапкой на главных страницах
class CoreGlobalOnBoardingDataSource {
  CoreGlobalOnBoardingDataSource(this._sharedPreferences);

  final Future<SharedPreferences> _sharedPreferences;

  /// подтверждаем что пользователь ранее заходил в приложение
  Future<void> confirmBeforeOpenApplication() async {
    final prefs = await _sharedPreferences;
    await prefs.setBool(
      GlobalPrefConstant.isBeforeViewOnboarding,
      true,
    );
  }

  /// получаем флаг был ли пользовтель ранее в приложении
  Future<bool> get isBeforeOpenApplication async {
    final prefs = await _sharedPreferences;
    return prefs.getBool(GlobalPrefConstant.isBeforeViewOnboarding) ?? false;
  }
}
