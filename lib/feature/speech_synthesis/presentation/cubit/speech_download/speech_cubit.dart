import 'dart:io';

import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/settings/select_speaker/data/repository/setting_speaker_global_repository.dart';
import 'package:aizere_app/feature/speech_synthesis/data/repository/synthesis_repository.dart';
import 'package:aizere_app/utils/permition_request.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

part 'speech_state.dart';

class SpeechCubit extends Cubit<SpeechState> {
  /// Инициализация с репозиториями и начальным состоянием
  SpeechCubit()
      : _speakerSetting = sl(),
        _synthesisRepository = sl(),
        super(SpeechInitial());

  final SynthesisRepository _synthesisRepository;
  final CoreGlobalSettingSpeakerRepository _speakerSetting;

  /// Локальные переменные для хранения настроек и путей
  int _speakerId = 0;
  String _filePath = GlobalConstant.empty;

  /// Инициализация Cubit: устанавливает начальное состояние и загружает настройки
  Future<void> initCubit() async {
    final state = _getCommonState();
    _speakerId = await _speakerSetting.selectedSpeaker;
    emit(state.copyWith(speakerId: _speakerId));
  }

  /// Запрашивает разрешения для доступа к файлам и записи аудио
  void downloadRequisites(String text) async {
    requestPermission(
      permission: Platform.isIOS ? Permission.storage : Permission.audio,
      onGrantedPermission: () async {
        final tempDir = Platform.isIOS
            ? await getApplicationDocumentsDirectory()
            : await getExternalStorageDirectory();
        await request(text, tempDir?.path);
      },
      onDenied: () => _handlePermissionError(),
      onDeniedForever: () => _handlePermissionError(),
    );
  }

  void _handlePermissionError() {
    emit(SpeechDownloadError('Permission error'));
  }

  /// Запрашивает аудиофайл, сохраняет его и инициализирует проигрыватель.
  ///
  /// [text] - текст для синтеза звука.
  /// [path] - путь для сохранения аудиофайла (если указан).
  Future<void> request(String text, String? path) async {
    /// Получение начального состояния
    final initialState = _getCommonState();
    _setLoadingState(initialState);

    try {
      /// Подготовка параметров для запроса аудиофайла
      final params = {'text': text};

      /// Запрос аудиофайла и сохранение его в указанном пути
      _filePath =
          await _synthesisRepository.getSynthesisAudioPath(params, path);

      /// Установка пути файла для проигрывателя
      //await player.setFilePath(_filePath);

      /// Уведомление об успешной загрузке и установке начального состояния
      _setSuccessState(initialState);
    } catch (e) {
      _setErrorState(initialState);
    }
  }

  /// Установка состояния загрузки
  void _setLoadingState(SpeechCommonState state) {
    emit(state.copyWith(isLoading: true));
  }

  /// Установка успешного состояния
  void _setSuccessState(SpeechCommonState state) {
    emit(SpeechSuccessDownloaded(_filePath));
    emit(state.copyWith(
      isLoading: false,
    ));
  }

  /// Установка состояния ошибки
  void _setErrorState(SpeechCommonState state) {
    emit(SpeechDownloadError('Повторите попытку позже'));
    emit(state.copyWith(
      isLoading: false,
    ));
  }

  SpeechCommonState _getCommonState() {
    if (state is SpeechCommonState) {
      return state as SpeechCommonState;
    }
    return SpeechCommonState(
      isLoading: false,
      speakerId: _speakerId,
    );
  }
}
