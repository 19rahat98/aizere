import 'dart:io';

import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/settings/voice_assistant/data/repository/setting_speaker_global_repository.dart';
import 'package:aizere_app/utils/permition_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

part 'player_state.dart';

class PlayerCubit extends Cubit<PlayerState> {
  PlayerCubit()
      : _speakerSpeedRepository = sl(),
        // _dataSource = sl(),
        super(PlayerInitial());

  // final AuthDataSource _dataSource;
  final CoreGlobalSpeakerSpeedRepository _speakerSpeedRepository;

  int get playerState => (state as PlayerCommonState).playerState;

  String get playPauseIconAsset {
    return playerState == 1 ? AppIcons.icPlayFilled : AppIcons.icPause;
  }

  final player = AudioPlayer();

  String _filePath = GlobalConstant.empty;

  double _speakerSpeed = 1;

  int _totalTime = 0;
  int _initialTime = 0;

  Dio dio = Dio();

  Future<void> initCubit(String url) async {
    final state = getCommonState();
    _speakerSpeed = await _speakerSpeedRepository.selectedSpeaker;
    player.setSpeed(_speakerSpeed);
    emit(
      state.copyWith(
        speedSpeaker: _speakerSpeed,
      ),
    );
    downloadRequisites(url);
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
  void downloadRequisites(String url) async {
    requestPermission(
      permission: Platform.isIOS ? Permission.storage : Permission.audio,
      onGrantedPermission: () async {
        await request(url);
      },
      onDenied: () {
        emit(PlayerDownloadError('Permission error'));
      },
      onDeniedForever: () {
        emit(PlayerDownloadError('Permission error'));
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
    emit(
      state.copyWith(
        isLoading: false,
        playerState: 0,
        initialTime: _initialTime,
      ),
    );
  }

  /// перемотка аудио
  Future<void> seekToPosition(double position) async {
    final state = getCommonState();
    final positionInSeconds = position.toInt();
    await player.seek(Duration(seconds: positionInSeconds));
    emit(
      state.copyWith(
        initialTime: positionInSeconds,
      ),
    );
  }

  Future<void> request(String url) async {
    final state = getCommonState();
    emit(
      state.copyWith(
        isLoading: true,
        playerState: 2,
      ),
    );

    try {
      final requestBytes = await doRequest(url);
      var tempDir = Platform.isIOS
          ? await getApplicationDocumentsDirectory()
          : await getExternalStorageDirectory();
      final fileName = DateTime.now().microsecondsSinceEpoch;
      final pathFile = "${tempDir?.path}/${fileName}.wav";
      File responseFile = File(pathFile);
      await responseFile.writeAsBytes(requestBytes);
      _filePath = responseFile.path;
      await player.setFilePath(_filePath);
      emit(PlayerSuccessDownloaded());
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
        PlayerDownloadError('Повторите попытку позже'),
      );
      emit(
        state.copyWith(
          isLoading: false,
          playerState: 0,
        ),
      );
    }
  }

  Future<Uint8List> doRequest(String url) async {
    return http.get(Uri.parse(url)).then((value) => value.bodyBytes);
  }

  void removeFavoriteState(value) {
    final state = getCommonState();
    emit(state.copyWith(
      isContain: value,
    ));
  }

  PlayerCommonState getCommonState() {
    if (state is PlayerCommonState) {
      return state as PlayerCommonState;
    }
    return PlayerCommonState(
      isLoading: false,
      isContain: false,
      totalTime: _totalTime,
      initialTime: _initialTime,
      speedSpeaker: _speakerSpeed,
    );
  }
}
