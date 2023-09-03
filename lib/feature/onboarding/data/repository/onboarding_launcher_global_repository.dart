import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/auth/data/pref/auth_data_source.dart';
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

/// репозиторий для работы с процесами запуска авторизованных юзеров
class CoreGlobalOnboardingRepository {
  CoreGlobalOnboardingRepository() : _authDataSource = sl();

  final AuthDataSource _authDataSource;

  /// получаем флаг был ли пользовтель ранее авторизован
  Future<bool> get isHaveAuthToken async {
    final token = await _authDataSource.token;
    if (token?.isNotEmpty ?? false) return true;

    return false;
  }

/// подтверждаем что пользователь ранее заходил в приложение
/*void confirmBeforeOpenApplication() =>
      _globalLauncherDataSource.confirmBeforeOpenApplication();*/
}