import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SynthesisProvider extends ChangeNotifier{
  final player = AudioPlayer();

  /// показываем состояние воспроизведение
  bool _playingAudio = false;
  bool get playingAudio => _playingAudio;

  /// для определение было ли в тексте изменение
  bool _newTextValue = false;
  bool get newTextValue => _newTextValue;
  set newTextValue(state){
    _newTextValue = state;
    notifyListeners();
  }

  /// показываем состояние загрузки
  bool _loadingState = false;
  bool get loadingState => _loadingState;

  double _playerSpeed = 1.0;
  double get playerSpeed => _playerSpeed;
  set playerSpeed(speedValue){
    _playerSpeed = speedValue;
    notifyListeners();
  }

  String _pathFile;
  static var httpClient = new HttpClient();
  TextEditingController textEditingController = TextEditingController();


  SynthesisProvider(){
    player.processingStateStream.listen((event) {
      if(event == ProcessingState.completed){
        _playingAudio = false;
        notifyListeners();
      }
    });
  }

  Future<String> _downloadFile(String url) async {
    try{
      _loadingState = true;
      notifyListeners();
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      String dir = (await getApplicationDocumentsDirectory()).path;
      String filePath = join(dir, "audioFile.wav");
      File file = new File(filePath);
      await file.writeAsBytes(bytes);
      return file.path;
    }catch(e){
      _playingAudio = false;
      _loadingState = false;
      notifyListeners();
      throw "internet error";
    }

  }


  void playAssetsAudioFile(String filePath)async{
    await player.setAsset(filePath);
    player.setSpeed(playerSpeed ?? 1.0);
    await player.play();
  }


  void playAudio(String url) async{
    if(player.processingState == ProcessingState.idle){
      _playingAudio = true;
      notifyListeners();
      try{
        if(_newTextValue){
          _downloadFile('http://${url}/get_speech_hifigan?text=${textEditingController.text}').then((filePath) async {
            _pathFile = filePath;
            _newTextValue = false;
            _loadingState = false;
            notifyListeners();
            await player.setFilePath(_pathFile);
            player.setSpeed(playerSpeed ?? 1.0);
            await player.play();
          });
        }else{
          await player.setFilePath(_pathFile);
          player.setSpeed(playerSpeed ?? 1.0);
          await player.play();
        }
      }catch(e){
        _playingAudio = false;
        notifyListeners();
      }
    }
    else if(player.processingState == ProcessingState.loading || player.processingState == ProcessingState.ready){
      if(player.playing){
        _playingAudio = false;
        notifyListeners();
        player.pause();
      }
      else{
        _playingAudio = true;
        notifyListeners();
        player.play();
      }
    }
    else{
      _playingAudio = true;
      notifyListeners();
      try{
        if(_newTextValue){
          _downloadFile('http://${url}/get_speech_hifigan?text=${textEditingController.text}').then((filePath) async {
            _pathFile = filePath;
            _newTextValue = false;
            _loadingState = false;
            notifyListeners();
            await player.setFilePath(_pathFile);
            player.setSpeed(playerSpeed ?? 1.0);
            await player.play();
          });
        }
        else{
          await player.setFilePath(_pathFile);
          player.setSpeed(playerSpeed ?? 1.0);
          await player.play();
        }

      }catch(e){
        _playingAudio = false;
        notifyListeners();
      }
    }

  }

  void stopPlayer(){
    _playingAudio = false;
    _loadingState = false;
    notifyListeners();
    player.stop();
  }

  void changePlayerSpeed(double value){
    player.setSpeed(value ?? 1.0);
    notifyListeners();
  }

  void setValueToSP(bool value)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('firstRun', value);
    notifyListeners();
  }


}