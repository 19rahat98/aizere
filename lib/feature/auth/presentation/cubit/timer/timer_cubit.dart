import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';


class TimerCubit extends Cubit<int> {
  TimerCubit() : super(_initial);

  late Timer _timer;

  void init(){
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 0) {
        emit(state - 1);
      } else {
        _timer.cancel();
      }
    });
  }

  static const _initial = 179;
}
