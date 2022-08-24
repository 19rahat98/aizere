import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

void init() async {
  _commonModule();
  _apiServiceModule();
  _dataSourceModule();
  _repositoryModule();
}

/// для общих зависимостей
void _commonModule() {
  // sl.registerSingletonAsync(() => createHttpClient(ApiUrl.baseUrl));
  // sl.registerFactory(() => LocationService());

  /// Shared preferences
  final sharedPreferences = SharedPreferences.getInstance();
  sl.registerSingletonAsync(() => sharedPreferences);
}

void _apiServiceModule() async {
  //sl.registerLazySingleton(() => NetworkCall());
}

/// для локального хранения данных
void _dataSourceModule() async {
  // sl.registerSingleton(UserDataSource(sl.getAsync()));
}

/// для репозиторий
void _repositoryModule() {
  // sl.registerFactory(() => HomeRepository());
}
