import 'package:aizere_app/common/constants/global_pref_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// data source для работы с типом календаря и шапкой на главных страницах
class CoreGlobalSettingDataSource {
  CoreGlobalSettingDataSource(this._sharedPreferences);

  final Future<SharedPreferences> _sharedPreferences;

  /// подтверждаем что пользователь предварительно настроил приложение
  Future<void> confirmBeforeSettingApplication() async {
    final _prefs = await _sharedPreferences;
    await _prefs.setBool(
      GlobalPrefConstant.isBeforeSettingApplication,
      true,
    );
  }

  /// получаем флаг был ли пользовтель ранее в приложении
  Future<bool> get isBeforeSettingApplication async {
    final _prefs = await _sharedPreferences;
    return _prefs.getBool(GlobalPrefConstant.isBeforeSettingApplication) ?? false;
  }
}
