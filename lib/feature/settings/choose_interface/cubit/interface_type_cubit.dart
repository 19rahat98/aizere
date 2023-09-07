import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InterfaceType { Standard, SpecialCapabilities }

class InterfaceTypeCubit extends Cubit<InterfaceType> {
  InterfaceTypeCubit() : super(InterfaceType.Standard);

  void setSelectedType(InterfaceType type) {
    emit(type);
  }

  Color getButtonColor(InterfaceType type) {
    return state == type ? AppColors.mainBlue : AppColors.monoGrey;
  }

  Color getButtonTextColor(InterfaceType type) {
    return state == type ? Colors.white : AppColors.mainBlack;
  }
}