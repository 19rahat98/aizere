import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  static const black = Color(0xFF211F1F);
  static const mainBlack = Color(0xFF292D32);
  static const mainBlue = Color(0xFF0A84FF);
  static const monoGrey = Color(0xFFEDEDED);
  static const monoGrey1 = Color(0xFF8A8E99);
  static const semanticDanger = Color(0xFFFF403D);
}

class AppIcons {
  static const icLogo = 'assets/svg/logo.svg';
  static const icEllipse = 'assets/svg/ic_ellipse.svg';
  static const icSmallEllipse = 'assets/svg/ic_small_ellipse.svg';
  static const icSoundLine = 'assets/svg/ic_sound_line.svg';
  static const icPlayFilled = 'assets/svg/ic_play_circle_filled.svg';
  static const icBook = 'assets/svg/ic_book.svg';
  static const icTickCircle = 'assets/svg/ic_tick_circle.svg';
  static const icInfoCircle = 'assets/svg/ic_info_circle.svg';
  static const icTurtle = 'assets/svg/ic_turtle.svg';
  static const icBunny = 'assets/svg/ic_bunny.svg';
  static const icArrowLeft = 'assets/svg/ic_arrow_left.svg';
  static const icArrowRight = 'assets/svg/ic_arrow_right.svg';
  static const icGlobal = 'assets/svg/ic_global.svg';
  static const icVolumeHigh = 'assets/svg/ic_volume_high.svg';
  static const icVoiceCircle = 'assets/svg/ic_voice_cricle.svg';
  static const icAizereBottom = 'assets/svg/ic_aizere_bb.svg';
  static const icSearch = 'assets/svg/ic_search.svg';
  static const icHeart = 'assets/svg/ic_heart.svg';
  static const icLibrary = 'assets/svg/ic_library.svg';
  static const icLoader = 'assets/svg/ic_loader.svg';
  static const icTrash = 'assets/svg/ic_trash.svg';
  static const icPause = 'assets/svg/ic_pause_filled.svg';
}

class AppImages {
  static const icRaya = 'assets/images/ic_raya.png';
  static const icIseke = 'assets/images/ic_iseke.png';
}

class AppTextStyle {
  static const TextStyle light = TextStyle(
    fontSize: 13,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
  );

  static const TextStyle textButtonStyle = TextStyle(
    fontSize: 17,
    color: AppColors.mainBlack,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
  );

  static const TextStyle body = TextStyle(
    fontSize: 17,
    color: AppColors.mainBlack,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
  );

  static const TextStyle regular = TextStyle(
    fontSize: 15,
    color: AppColors.monoGrey1,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
  );

  static const TextStyle title1 = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle title = TextStyle(
    fontSize: 24,
    color: AppColors.mainBlack,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );
}

class AppTheme {
  static ThemeData defaultTheme = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      color: Colors.deepOrange,
      //brightness: Brightness.light,
      elevation: 0,
      /// Задает цвет статус бара в зависимости от платформы
      systemOverlayStyle: Platform.isAndroid
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
    ),
  );
}