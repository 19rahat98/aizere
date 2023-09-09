import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/settings/select_speaker/data/repository/setting_speaker_global_repository.dart';
import 'package:aizere_app/feature/settings/voice_assistant/data/repository/setting_speaker_global_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

part 'speech_play_state.dart';

class SpeechPlayCubit extends Cubit<SpeechPlayState> {
  SpeechPlayCubit()
      : _speakerDataSource = sl(),
        _speakerSpeedDataSource = sl(),
        super(SpeechPlayInitial());

  final CoreGlobalSettingSpeakerRepository _speakerDataSource;
  final CoreGlobalSpeakerSpeedRepository _speakerSpeedDataSource;

  int _speakerId = 0;
  double _speakerSpeed = 1;
  final player = AudioPlayer();
  String _filePath = GlobalConstant.empty;

  int _totalTime = 0;
  int _initialTime = 0;

  Future<void> initCubit(String audioPath) async {
    final state = getCommonState();

    _speakerId = await _speakerDataSource.selectedSpeaker;
    _speakerSpeed = await _speakerSpeedDataSource.selectedSpeaker;
    await player.setFilePath(_filePath = audioPath);
    player.setSpeed(_speakerSpeed);
    emit(
      state.copyWith(
        speakerId: _speakerId,
        speedSpeaker: _speakerSpeed,
        totalTime: _totalTime = player.duration?.inSeconds ?? 0,
      ),
    );
    listenPlayer();
  }

  Future<void> listenPlayer() async {
    final state = getCommonState();
    player.positionStream.listen(
      (event) {
        emit(
          state.copyWith(
            initialTime: _initialTime = event.inSeconds,
          ),
        );
      },
    );

    player.processingStateStream.listen(
      (event) async {
        if (event == ProcessingState.completed) {
          final state = getCommonState();
          player.stop();
          await player.setFilePath(_filePath);
          emit(
            state.copyWith(playerState: 1, initialTime: _initialTime = 0),
          );
        }
      },
    );
  }

  Future<void> playAudio() async {
    final state = getCommonState();
    late int playStatus;
    if (player.playing) {
      player.pause();
      playStatus = 1;
    } else {
      player.play();
      playStatus = 2;
    }
    emit(state.copyWith(
      playerState: playStatus,
    ));
  }

  void stopAudio() {
    final state = getCommonState();
    player.stop();
    _initialTime = 0;
    emit(state.copyWith(
      isLoading: false,
      playerState: 0,
      initialTime: _initialTime,
    ));
  }

  SpeechPlayCommonState getCommonState() {
    if (state is SpeechPlayCommonState) {
      return state as SpeechPlayCommonState;
    }
    return SpeechPlayCommonState(
      isLoading: false,
      isContain: false,
      totalTime: _totalTime,
      speakerId: _speakerId,
      initialTime: _initialTime,
      speedSpeaker: _speakerSpeed,
    );
  }
}
