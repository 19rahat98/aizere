import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/onboarding/data/pref/onboarding_global_data_source.dart';

/// репозиторий для работы с процесами при запуске приложения
class CoreGlobalOnboardingLauncherRepository {
  CoreGlobalOnboardingLauncherRepository() : _globalLauncherDataSource = sl();

  final CoreGlobalOnBoardingDataSource _globalLauncherDataSource;

  /// получаем флаг был ли пользовтель ранее в приложении
  Future<bool> get isBeforeOpenApplication =>
      _globalLauncherDataSource.isBeforeOpenApplication;

  /// подтверждаем что пользователь ранее заходил в приложение
  void confirmBeforeOpenApplication() =>
      _globalLauncherDataSource.confirmBeforeOpenApplication();
}

/// репозиторий для работы с процесами при запуске приложения
class CoreGlobalSettingRepository {
  CoreGlobalSettingRepository() : _globalLauncherDataSource = sl();

  final CoreGlobalOnBoardingDataSource _globalLauncherDataSource;

  /// получаем флаг был ли пользовтель ранее в приложении
  Future<bool> get isBeforeOpenApplication =>
      _globalLauncherDataSource.isBeforeOpenApplication;

  /// подтверждаем что пользователь ранее заходил в приложение
  void confirmBeforeOpenApplication() =>
      _globalLauncherDataSource.confirmBeforeOpenApplication();
}
