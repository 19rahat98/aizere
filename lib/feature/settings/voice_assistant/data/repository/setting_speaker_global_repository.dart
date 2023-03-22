import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/settings/voice_assistant/data/pref/setting_speaker_global_data_source.dart';

/// репозиторий для работы с процесами при запуске приложения
class CoreGlobalSpeakerSpeedRepository {
  CoreGlobalSpeakerSpeedRepository() : _speedDataSource = sl();

  final CoreGlobalVoiceSpeedDataSource _speedDataSource;

  Future<double> get selectedSpeaker =>
      _speedDataSource.getSpeakerVoiceSpeed;

  Future<void> setAppLocal(double speed) =>
      _speedDataSource.selectSpeakerSpeed(speed);
}
