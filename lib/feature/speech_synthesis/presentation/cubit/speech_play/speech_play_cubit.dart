import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/feature/settings/select_speaker/data/repository/setting_speaker_global_repository.dart';
import 'package:aizere_app/feature/settings/voice_assistant/data/repository/setting_speaker_global_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

part 'speech_play_state.dart';

class SpeechPlayCubit extends Cubit<SpeechPlayState> {
  SpeechPlayCubit(this._speakerRepository, this._speakerSpeedRepository)
      : super(SpeechPlayInitial());
  final CoreGlobalSettingSpeakerRepository _speakerRepository;
  final CoreGlobalSpeakerSpeedRepository _speakerSpeedRepository;

  final player = AudioPlayer();

  int _speakerId = 0;
  double _speakerSpeed = 1;

  int _totalTime = 0;
  int _initialTime = 0;

  final String _filePath = GlobalConstant.empty;

  Future<void> initCubit() async {
    final state = getCommonState();
    _speakerId = await _speakerRepository.selectedSpeaker;
    _speakerSpeed = await _speakerSpeedRepository.selectedSpeaker;
    emit(
      state.copyWith(
        speakerId: _speakerId,
        speedSpeaker: _speakerSpeed,
      ),
    );
    listenPlayer();
  }

  Future<void> listenPlayer() async {
    player.bufferedPositionStream.listen((event) {
      final state = getCommonState();
      _totalTime = event.inSeconds;
      emit(
        state.copyWith(
          totalTime: _totalTime,
          initialTime: _initialTime,
        ),
      );
    });
    player.positionStream.listen((event) {
      final state = getCommonState();
      _initialTime = event.inSeconds;
      emit(
        state.copyWith(
          totalTime: _totalTime,
          initialTime: _initialTime,
        ),
      );
    });
    player.processingStateStream.listen((event) async {
      if (event == ProcessingState.completed) {
        final state = getCommonState();
        player.stop();
        await player.setFilePath(_filePath);
        emit(
          state.copyWith(
            playerState: 1,
          ),
        );
      }
    });
  }

  SpeechCommonState getCommonState() {
    if (state is SpeechCommonState) {
      return state as SpeechCommonState;
    }
    return SpeechCommonState(
      isLoading: false,
      isContain: false,
      totalTime: _totalTime,
      initialTime: _initialTime,
      speakerId: _speakerId,
      speedSpeaker: _speakerSpeed,
    );
  }

  Future<void> playAudio() async {
    final state = getCommonState();
    if (player.playing) {
      player.pause();
      emit(state.copyWith(
        playerState: 1,
      ));
    } else {
      player.setSpeed(_speakerSpeed);
      player.play();
      emit(state.copyWith(
        playerState: 2,
      ));
    }
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
}
