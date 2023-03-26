import 'package:aizere_app/common/constants/global_pref_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// data source для работы с типом календаря и шапкой на главных страницах
class CoreGlobalSettingLocalDataSource {
  CoreGlobalSettingLocalDataSource(this._sharedPreferences);

  final Future<SharedPreferences> _sharedPreferences;

  /// подтверждаем что пользователь предварительно настроил приложение
  Future<void> selectApplicationLocal(int index) async {
    final prefs = await _sharedPreferences;
    await prefs.setInt(
      GlobalPrefConstant.prefLocalization,
      index,
    );
  }

  /// получаем флаг был ли пользовтель ранее в приложении
  Future<int> get isSelectedApplicationLocal async {
    final prefs = await _sharedPreferences;
    return prefs.getInt(GlobalPrefConstant.prefLocalization) ?? 2;
  }
}
