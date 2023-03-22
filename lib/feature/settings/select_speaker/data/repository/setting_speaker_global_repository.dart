import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/settings/select_speaker/data/pref/setting_speaker_global_data_source.dart';

/// репозиторий для работы с процесами при запуске приложения
class CoreGlobalSettingSpeakerRepository {
  CoreGlobalSettingSpeakerRepository() : _speakerDataSource = sl();

  final CoreGlobalSpeakerDataSource _speakerDataSource;

  /// получаем индекс спикера
  Future<int> get selectedSpeaker =>
      _speakerDataSource.selectedApplicationSpeaker;

  Future<void> setAppLocal(int index) =>
      _speakerDataSource.selectApplicationSpeaker(index);
}
