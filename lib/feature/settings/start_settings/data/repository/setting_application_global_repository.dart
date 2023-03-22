import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/settings/start_settings/data/pref/setting_global_data_source.dart';

/// репозиторий для работы с процесами при запуске приложения
class CoreGlobalSettingLauncherRepository {
  CoreGlobalSettingLauncherRepository() : _globalLauncherSetting = sl();

  final CoreGlobalSettingDataSource _globalLauncherSetting;

  /// получаем флаг был ли пользовтель ранее в приложении
  Future<bool> get isBeforeConfiguredApplication =>
      _globalLauncherSetting.isBeforeSettingApplication;

  /// подтверждаем что пользователь ранее заходил в приложение
  void confirmBeforeConfiguredApplication() =>
      _globalLauncherSetting.confirmBeforeSettingApplication();
}
