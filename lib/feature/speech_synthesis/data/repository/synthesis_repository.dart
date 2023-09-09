import 'dart:io';

import 'package:aizere_app/common/network/api_service.dart';
import 'package:aizere_app/di/di_locator.dart';
import 'package:dio/dio.dart';

/// Репозиторий для работы со синтезом звука.
class SynthesisRepository {
  /// Конструктор инициализирует объект с сервисом API.
  SynthesisRepository() : _apiService = sl();

  final AuthorizedApiService _apiService;

  /// Запрашивает аудио синтез из API и сохраняет файл в указанный путь.
  ///
  /// [params] содержит параметры для запроса к API.
  /// [savePath] указывает, куда будет сохранен аудиофайл.
  /// Возвращает файл с аудиозаписью.
  Future<String> getSynthesisAudioPath(
    Map<String, dynamic> params,
    String? savePath,
  ) async {
    try {
      /// Отправка запроса к API
      final response = await _apiService.getSynthesisAudio(
        param: FormData.fromMap(params),
      );

      /// Проверка на наличие данных в ответе
      if (response.data.isEmpty) {
        throw Exception("Получены пустые данные от API");
      }

      /// Генерация уникального имени для файла
      final fileName = DateTime.now().microsecondsSinceEpoch;
      final audioFilePath = "$savePath/${fileName}Aizere.wav";

      /// Создание и запись данных в файл
      final audioFile = File(audioFilePath);
      await audioFile.writeAsBytes(response.data);

      return audioFile.path;
    } catch (e) {
      throw Exception('Ошибка при получении и сохранении аудио: $e');
    }
  }
}
