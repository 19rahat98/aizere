import 'dart:io';

import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/settings/select_speaker/data/repository/setting_speaker_global_repository.dart';
import 'package:aizere_app/feature/settings/voice_assistant/data/repository/setting_speaker_global_repository.dart';
import 'package:aizere_app/utils/permition_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

part 'speech_state.dart';

class SpeechCubit extends Cubit<SpeechState> {
  SpeechCubit()
      : _speakerRepository = sl(),
        _speakerSpeedRepository = sl(),
        super(SpeechInitial());

  final CoreGlobalSettingSpeakerRepository _speakerRepository;
  final CoreGlobalSpeakerSpeedRepository _speakerSpeedRepository;

  int get playerState => (state as SpeechCommonState).playerState;

  String get playPauseIconAsset {
    return playerState == 1 ? AppIcons.icPlay : AppIcons.icStop;
  }

  final player = AudioPlayer();

  String _filePath = GlobalConstant.empty;

  int _speakerId = 0;
  double _speakerSpeed = 1;

  int _totalTime = 0;
  int _initialTime = 0;

  Dio dio = Dio();

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

  Future<void> setSpeed(double speed) async {
    final state = getCommonState();
    _speakerSpeed = speed;
    player.setSpeed(_speakerSpeed);
    await _speakerSpeedRepository.setAppLocal(speed);
    emit(
      state.copyWith(
        speedSpeaker: speed,
      ),
    );
  }

  /// запрашиваем разрешение на запись и чтение памяти
  void downloadRequisites(String text) async {
    requestPermission(
      permission: Platform.isIOS ? Permission.storage : Permission.audio,
      onGrantedPermission: () async {
        await request(text);
      },
      onDenied: () {
        emit(SpeechDownloadError('Permission error'));
      },
      onDeniedForever: () {
        emit(SpeechDownloadError('Permission error'));
      },
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

  Future<void> request(String text) async {
    final state = getCommonState();
    emit(
      state.copyWith(
        isLoading: true,
        playerState: 2,
      ),
    );

    try {
      final requestBytes = await doRequest(text, speaker: _speakerId);
      var tempDir = Platform.isIOS
          ? await getApplicationDocumentsDirectory()
          : await getExternalStorageDirectory();
      final fileName = DateTime.now().microsecondsSinceEpoch;
      final pathFile = "${tempDir?.path}/${fileName}Aizere.wav";
      File responseFile = File(pathFile);
      await responseFile.writeAsBytes(requestBytes);
      _filePath = responseFile.path;
      await player.setFilePath(_filePath);
      emit(SpeechSuccessDownloaded());
      emit(
        state.copyWith(
          isLoading: false,
          playerState: 1,
          totalTime: _totalTime,
          initialTime: _initialTime,
        ),
      );
    } catch (e) {
      emit(
        SpeechDownloadError(
          e.toString(),
        ),
      );
      emit(
        state.copyWith(
          isLoading: false,
          playerState: 0,
        ),
      );
      rethrow;
    }
  }

  Future<Uint8List> doRequest(String text, {int? speaker}) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://185.22.65.38:8000/tts/"),
    );
    request.headers.addAll(
        {'Authorization': 'Token 0b8dee37be7188af8ea9b91c6b1e87176d60c7c6'});
    request.fields.addAll(
      {
        'text': text,
      },
    );

    http.Response response = await http.Response.fromStream(
      await request.send(),
    );
    return response.bodyBytes;
  }

  void removeFavoriteState(value) {
    final state = getCommonState();
    emit(state.copyWith(
      isContain: value,
    ));
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
}