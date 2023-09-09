import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/settings/voice_assistant/data/repository/setting_speaker_global_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

part 'speech_play_state.dart';

/// Кубит для проигрование аудио синтеза
class SpeechPlayCubit extends Cubit<SpeechPlayState> {
  /// Инициализация с репозиториями и начальным состоянием
  SpeechPlayCubit()
      : _speakerSpeedDataSource = sl(),
        super(SpeechPlayInitial());

  final _player = AudioPlayer();
  final CoreGlobalSpeakerSpeedRepository _speakerSpeedDataSource;

  int _initialTime = 0;
  double _speakerSpeed = 1;
  String _filePath = GlobalConstant.empty;

  /// Инициализация Cubit'а
  Future<void> initCubit(String audioPath) async {
    _speakerSpeed = await _speakerSpeedDataSource.selectedSpeaker;
    await _player.setFilePath(audioPath);
    _player.setSpeed(_speakerSpeed);
    _filePath = audioPath;
    _setupPlayerListeners();
    _updateCommonState();
  }

  /// Установка слушателей для плеера
  void _setupPlayerListeners() {
    _player.positionStream.listen((event) {
      _initialTime = event.inSeconds;
      _updateCommonState(initialTime: _initialTime);
    });

    _player.processingStateStream.listen((event) async {
      if (event == ProcessingState.completed) {
        _player.stop();
        await _player.setFilePath(_filePath);
        _updateCommonState(initialTime: 0);
      }
    });
  }

  /// Воспроизведение аудио
  Future<void> playAudio() async {
    if (_player.playing) {
      _player.pause();
    } else {
      _player.play();
    }
    _updateCommonState();
  }

  /// Остановка аудио
  void stopAudio() {
    _player.stop();
    _initialTime = 0;
    _updateCommonState(
      isLoading: false,
      initialTime: _initialTime,
    );
  }

  /// Обновление состояния
  void _updateCommonState({
    bool? isLoading,
    int? initialTime,
    double? speedSpeaker,
  }) {
    emit(
      SpeechPlayCommonState(
        playerState: _player.playing ? 2 : 1,
        initialTime: initialTime ?? _initialTime,
        speedSpeaker: speedSpeaker ?? _speakerSpeed,
        totalTime: _player.duration?.inSeconds ?? 60,
      ),
    );
  }
}
