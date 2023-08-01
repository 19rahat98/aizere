// ignore_for_file: cascade_invocations

import 'package:aizere_app/common/constants/global_dio_constant.dart';
import 'package:aizere_app/common/network/api_service.dart';
import 'package:aizere_app/common/network/core_network.dart';
import 'package:aizere_app/di/local_storage_servic.dart';
import 'package:aizere_app/feature/favorites/data/pref/favorite_global_data_source.dart';
import 'package:aizere_app/feature/favorites/data/repository/favorites_global_repository.dart';
import 'package:aizere_app/feature/language_logic/data/repositories/language_logic_repository_impl.dart';
import 'package:aizere_app/feature/language_logic/domain/usecase/get_default_language_code_use_case.dart';
import 'package:aizere_app/feature/library/data/repository/library_repository.dart';
import 'package:aizere_app/feature/library/domain/use_case/get_class_lib_use_case.dart';
import 'package:aizere_app/feature/onboarding/data/pref/onboarding_global_data_source.dart';
import 'package:aizere_app/feature/onboarding/data/repository/global_settings_repositpry.dart';
import 'package:aizere_app/feature/onboarding/data/repository/onboarding_launcher_global_repository.dart';
import 'package:aizere_app/feature/onboarding/domain/usecase/global_launcher_usercase.dart';
import 'package:aizere_app/feature/settings/choose_local/data/pref/setting_locla_global_data_source.dart';
import 'package:aizere_app/feature/settings/choose_local/data/repository/setting_local_global_repository.dart';
import 'package:aizere_app/feature/settings/select_speaker/data/pref/setting_speaker_global_data_source.dart';
import 'package:aizere_app/feature/settings/select_speaker/data/repository/setting_speaker_global_repository.dart';
import 'package:aizere_app/feature/settings/start_settings/data/pref/setting_global_data_source.dart';
import 'package:aizere_app/feature/settings/start_settings/data/repository/setting_application_global_repository.dart';
import 'package:aizere_app/feature/settings/start_settings/domain/usecase/global_app_setting_usercase.dart';
import 'package:aizere_app/feature/settings/voice_assistant/data/pref/setting_speaker_global_data_source.dart';
import 'package:aizere_app/feature/settings/voice_assistant/data/repository/setting_speaker_global_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

void initLocator() {
  _commonModule();
  _localStorageModule();
  _apiServiceModule();
  _dataSourceModule();
  _repositoryModule();
  _useCaseModule();
}

/// для общих зависимостей
// ignore: avoid_void_async
void _commonModule() async {
  /// Shared preferences
  final sharedPreferences = SharedPreferences.getInstance();
  sl.registerSingletonAsync(() => sharedPreferences);
}

Future _localStorageModule() async {
  sl.registerSingleton<LocalStorageService>(await LocalStorageService().init());
}

Future _apiServiceModule() async {
  //sl.registerLazySingleton(() => NetworkCall());
  sl.registerSingletonAsync(
    () => createHttpClient(GlobalDioConstant.apiBaseUrl),
    instanceName: GlobalDioConstant.authorized,
  );

  sl.registerSingleton(
    ApiService(
      sl.getAsync(
        instanceName: GlobalDioConstant.authorized,
      ),
    ),
  );
}

/// для локального хранения данных
Future<void> _dataSourceModule() async {
  sl.registerFactory(() => CoreGlobalSettingDataSource(sl.getAsync()));
  sl.registerFactory(() => CoreGlobalOnBoardingDataSource(sl.getAsync()));
  sl.registerFactory(() => CoreGlobalSettingLocalDataSource(sl.getAsync()));
  sl.registerFactory(() => CoreGlobalSpeakerDataSource(sl.getAsync()));
  sl.registerFactory(() => CoreGlobalVoiceSpeedDataSource(sl.getAsync()));
  sl.registerFactory(() => CoreFavoriteDataSource(sl.getAsync()));
}

/// для репозиторий
void _repositoryModule() {
  sl.registerFactory(() => GlobalSettingsRepository());
  sl.registerFactory(() => CoreGlobalOnboardingLauncherRepository());
  sl.registerFactory(() => CoreGlobalSettingLocalRepository());
  sl.registerFactory(() => LanguageLogicRepositoryImpl());
  sl.registerFactory(() => CoreGlobalSettingSpeakerRepository());
  sl.registerFactory(() => CoreGlobalSpeakerSpeedRepository());
  sl.registerFactory(() => CoreGlobalSettingLauncherRepository());
  sl.registerFactory(() => CoreGlobalFavoritesRepository());
  sl.registerFactory(() => LibraryRepository());
}

void _useCaseModule() async {
  sl.registerFactory(GlobalRegisterViewOnboardingUseCase.new);
  sl.registerFactory(GlobalMakeActionInputApplicationUseCase.new);
  sl.registerFactory(GlobalMakeSettingApplicationUseCase.new);
  sl.registerFactory(GlobalRegisterConfigureAppUseCase.new);
  sl.registerFactory(GetDefaultLanguageCode.new);
  sl.registerFactory(GetClassLibraryUseCase.new);
}
