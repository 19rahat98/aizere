import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider extends ChangeNotifier{

  SharedPreferences pref;
  int _currentPage = 0;
  int get currentPage => _currentPage;
  set newCurrentPage(state){
    _currentPage = state;
    notifyListeners();
  }


  SplashProvider(){
    initializeSharedPref();
  }

  Future<bool> initializeSharedPref() async{
    pref = await SharedPreferences.getInstance();
    return isItFirstRun();
  }

  bool isItFirstRun(){
    final spValue = pref.getBool('applicationFirstRun');
    return spValue ?? false;
  }

  void setApplicationRunStatus(bool value){
    pref.setBool('applicationFirstRun', value);
  }

  PageController pageController = PageController(initialPage: 0);


  void changeSplashPage(int index){
    _currentPage = index;
    notifyListeners();
  }

}