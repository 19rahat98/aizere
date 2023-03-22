import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/settings/choose_local/data/pref/setting_locla_global_data_source.dart';

/// репозиторий для работы с процесами при запуске приложения
class CoreGlobalSettingLocalRepository {
  CoreGlobalSettingLocalRepository() : _localDataSource = sl();

  final CoreGlobalSettingLocalDataSource _localDataSource;

  /// получаем флаг выбрад ли пользовтель в приложении язык
  Future<int> get isSelectedLocal =>
      _localDataSource.isSelectedApplicationLocal;

  /// подтверждаем что пользователь ранее выбрал язык проложение
  Future<void> setAppLocal(int index) =>
      _localDataSource.selectApplicationLocal(index);
}
