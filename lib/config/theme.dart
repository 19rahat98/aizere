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
  static const ffABB0BC = Color(0xFFABB0BC);
  static const ffE82C2C = Color(0xFFE82C2C);
  static const ffF6F5FA = Color(0xFFF6F5FA);
  static const ffF0F0F0 = Color(0xFFF0F0F0);
  static const ffD8EBFF = Color(0xFFD8EBFF);
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
  static const icRepeat = 'assets/svg/ic_repeate.svg';
  static const icHeartFilled = 'assets/svg/ic_heart_filled.svg';
  static const icMicrophone = 'assets/svg/ic_microphone.svg';
  static const icAizere = 'assets/svg/ic_aizere.svg';
  static const icPet = 'assets/svg/ic_pet.svg';
  static const icSuccess = 'assets/svg/ic_success.svg';
  static const icNote = 'assets/svg/ic_note.svg';
  static const icRaya = 'assets/images/ic_raya.png';
  static const icClock = 'assets/svg/ic_clock.svg';
  static const icPlay = 'assets/svg/ic_play.svg';
  static const icStop = 'assets/svg/ic_stop.svg';
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
  static const TextStyle w400s14 = TextStyle(
    fontSize: 14,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
  );

  static const TextStyle text = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );
  static const TextStyle w600s18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );

static const TextStyle w500s15 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
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
  static const TextStyle w400s16 = TextStyle(
    fontSize: 16,
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
  static const TextStyle titleBig = TextStyle(
    fontSize: 28,
    color: AppColors.mainBlack,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );
  static const TextStyle w600s22 = TextStyle(
    fontSize: 22,
    color: AppColors.mainBlack,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );
}

class AppTheme {
  static ThemeData defaultTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
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
