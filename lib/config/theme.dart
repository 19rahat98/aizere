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
  static const grayBlue = Color(0xFFABB0BC);
  static const errorRed = Color(0xFFE82C2C);
  static const lavender = Color(0xFFF6F5FA);
  static const lightGrey = Color(0xFFF0F0F0);
  static const red = Color(0xFFE82C2C);
  static const grey = Color(0xFFF6F5FA);
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
  static const icHeartFilled = 'assets/svg/ic_heart_filled.svg';
  static const icMicrophone = 'assets/svg/ic_microphone.svg';
  static const icAizere = 'assets/svg/ic_aizere.svg';
  static const icPet = 'assets/svg/ic_pet.svg';
  static const icSuccess = 'assets/svg/ic_success.svg';
  static const icGlasses = 'assets/svg/ic_glasses.svg';
  static const icLetters = 'assets/svg/ic_letters.svg';
  static const icNote = 'assets/svg/ic_note.svg';
  static const icRaya = 'assets/images/ic_raya.png';
  static const icClock = 'assets/svg/ic_clock.svg';
  static const icPlay = 'assets/svg/ic_play.svg';
  static const icStop = 'assets/svg/ic_stop.svg';
  static const icVisibilityOffPassword =
      'assets/svg/ic_visibility_off_password.svg';
  static const icVisibilityPassword = 'assets/svg/ic_visibility_password.svg';
  static const icSettings = 'assets/svg/ic_settings.svg';
  static const icImport = 'assets/svg/ic_import.svg';
  static const icShuffle = 'assets/svg/ic_shuffle.svg';
  static const icRepeat = 'assets/svg/ic_repeat.svg';
  static const icPrevious = 'assets/svg/ic_previous.svg';
  static const icNext = 'assets/svg/ic_next.svg';
  static const icShare = 'assets/svg/ic_share.svg';
  static const icPerson = 'assets/svg/ic_person.svg';
  static const icWarning = 'assets/svg/ic_warning.svg';
  static const icStar = 'assets/svg/ic_star.svg';
  static const icProfileAdd = 'assets/svg/ic_profile_add.svg';
  static const icGear = 'assets/svg/ic_gear.svg';
  static const icBell = 'assets/svg/ic_bell.svg';
  static const icInstagram = 'assets/svg/ic_instagram.svg';
  static const icSms = 'assets/svg/ic_sms.svg';
  static const icQuestion = 'assets/svg/ic_question.svg';
  static const icDocument = 'assets/svg/ic_document.svg';
  static const icFaceId = 'assets/svg/ic_face_id.svg';
  static const icLamp = 'assets/svg/ic_lamp.svg';
  static const icMusic = 'assets/svg/ic_music.svg';
  static const icVoiceSquare = 'assets/svg/ic_voice_square.svg';
  static const icTick = 'assets/svg/ic_tick.svg';
}

class AppImages {
  static const icRaya = 'assets/images/ic_raya.png';
  static const icIseke = 'assets/images/ic_iseke.png';
  static const delete = 'assets/images/delete.png';
}

class AppTextStyle {
  static const TextStyle light = TextStyle(
    fontSize: 13,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
  );

  static const TextStyle heading = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
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

  static const TextStyle text = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );
}

class AppTheme {
  static ThemeData defaultTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.deepOrange,

      /// Задает цвет статус бара в зависимости от платформы
      systemOverlayStyle: Platform.isAndroid
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
    ),
  );
}
