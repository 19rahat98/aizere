import 'package:aizere_app/common/core/core_use_case.dart';
import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/settings/start_settings/data/repository/setting_application_global_repository.dart';

/// выполняет действия при входе в приложение
class GlobalMakeSettingApplicationUseCase
    extends CoreFutureNoneParamUseCase<bool> {
  GlobalMakeSettingApplicationUseCase()
      : _settingLauncherRepository = sl();

  final CoreGlobalSettingLauncherRepository _settingLauncherRepository;

  @override
  Future<bool> execute() async {
    /// запрашиваем, впервые ли пользователь в приложении
    final isBeforeOpenApplication =
        await _settingLauncherRepository.isBeforeConfiguredApplication;

    return isBeforeOpenApplication;
  }
}

/// регистрируем просмотр онбординга
class GlobalRegisterConfigureAppUseCase
    extends CoreFutureNoneParamUseCase<void> {
  GlobalRegisterConfigureAppUseCase() : _settingLauncherRepository = sl();

  final CoreGlobalSettingLauncherRepository _settingLauncherRepository;


  @override
  Future<void> execute() async {
    return _settingLauncherRepository.confirmBeforeConfiguredApplication();
  }
}
