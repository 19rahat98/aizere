import 'package:aizere_app/common/constants/global_pref_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// data source для работы с типом календаря и шапкой на главных страницах
class CoreGlobalVoiceSpeedDataSource {
  CoreGlobalVoiceSpeedDataSource(this._sharedPreferences);

  final Future<SharedPreferences> _sharedPreferences;

  /// подтверждаем что пользователь предварительно настроил приложение
  Future<void> selectSpeakerSpeed(double speed) async {
    final prefs = await _sharedPreferences;
    await prefs.setDouble(
      GlobalPrefConstant.prefVoiceSpeed,
      speed,
    );
  }

  /// получаем флаг был ли пользовтель ранее в приложении
  Future<double> get getSpeakerVoiceSpeed async {
    final prefs = await _sharedPreferences;
    return prefs.getDouble(GlobalPrefConstant.prefVoiceSpeed) ?? 1;
  }
}
