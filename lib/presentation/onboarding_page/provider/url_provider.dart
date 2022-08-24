import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/foundation.dart';
import 'package:speech_synthesis/presentation/home_page/ui/home_page_screen.dart';
import 'package:speech_synthesis/presentation/splash_page/ui/splash.dart';

class UrlProvider extends ChangeNotifier {
  String _baseUrl = '';

  String get baseUrl => _baseUrl;

  /// показываем состояние загрузки
  bool _loadingState = false;

  bool get loadingState => _loadingState;

  String _pathFile;

  static var httpClient = new HttpClient();

  Future<void> initProvider(BuildContext context) async {
    _downloadFile('https://drive.google.com/uc?export=download&id=11HyYE65PlEQUUw_p3yVDXAmBIiazASyn')
        .then((filePath) async {
      Uri myUri = Uri.parse(filePath);
      File audioFile = new File.fromUri(myUri);
      final data = await json.decode(audioFile.readAsStringSync());
      _baseUrl = data["ip_address"];
      _loadingState = false;
      notifyListeners();
      SharedPreferences.getInstance().then((value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => value.getBool('firstRun') ?? false == true
                ? HomePageScreen(
                 requestUrl: _baseUrl,
                ) : SplashScreen(
                  requestUrl: _baseUrl,
                ),
            ));
      });
    });
  }

  Future<String> _downloadFile(String url, {String fileName = 'routeJson.json'}) async {
    try {
      _loadingState = true;
      notifyListeners();
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      String dir = (await getApplicationDocumentsDirectory()).path;
      String filePath = join(dir, fileName);
      File file = new File(filePath);
      await file.writeAsBytes(bytes);
      return file.path;
    } catch (e) {
      _loadingState = false;
      notifyListeners();
      throw "internet error";
    }
  }
}
