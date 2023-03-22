import 'package:aizere_app/common/core/core_use_case.dart';
import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/onboarding/data/repository/onboarding_launcher_global_repository.dart';
import 'package:aizere_app/feature/settings/start_settings/data/repository/setting_application_global_repository.dart';

/// выполняет действия при входе в приложение
class GlobalMakeActionInputApplicationUseCase
    extends CoreFutureNoneParamUseCase<GlobalMakeActionInputApplicationResult> {
  GlobalMakeActionInputApplicationUseCase()
      : _launcherRepository = sl(),
        _settingsRepository = sl();

  final CoreGlobalSettingLauncherRepository _settingsRepository;
  final CoreGlobalOnboardingLauncherRepository _launcherRepository;

  @override
  Future<GlobalMakeActionInputApplicationResult> execute() async {
    /// запрашиваем, впервые ли пользователь в приложении
    final isBeforeOpenApplication =
        await _launcherRepository.isBeforeOpenApplication;

    final isBeforeConfigured =
        await _settingsRepository.isBeforeConfiguredApplication;

    /// если пользователь ранее не был в приложении
    if (!isBeforeOpenApplication) {
      /// записываем его первичное действие
      _launcherRepository.confirmBeforeOpenApplication();
    }

    return GlobalMakeActionInputApplicationResult(
      isBeforeSetting: isBeforeConfigured,
      isBeforeOpenApplication: isBeforeOpenApplication,
    );
  }
}

/// результат для [GlobalMakeActionInputApplicationUseCase]
class GlobalMakeActionInputApplicationResult {
  GlobalMakeActionInputApplicationResult({
    required this.isBeforeOpenApplication,
    this.isBeforeSetting = false,
  });

  final bool isBeforeOpenApplication;
  final bool isBeforeSetting;
}

/// регистрируем просмотр онбординга
class GlobalRegisterViewOnboardingUseCase
    extends CoreFutureNoneParamUseCase<void> {
  GlobalRegisterViewOnboardingUseCase() : _launcherRepository = sl();

  final CoreGlobalOnboardingLauncherRepository _launcherRepository;


  @override
  Future<void> execute() async {
    return _launcherRepository.confirmBeforeOpenApplication();
  }
}
