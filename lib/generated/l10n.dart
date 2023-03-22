// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Пропустить`
  String get skip {
    return Intl.message(
      'Пропустить',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Шаг 2`
  String get stepTwo {
    return Intl.message(
      'Шаг 2',
      name: 'stepTwo',
      desc: '',
      args: [],
    );
  }

  /// `Шаг 1`
  String get stepOne {
    return Intl.message(
      'Шаг 1',
      name: 'stepOne',
      desc: '',
      args: [],
    );
  }

  /// `Скопируйте текст`
  String get copyText {
    return Intl.message(
      'Скопируйте текст',
      name: 'copyText',
      desc: '',
      args: [],
    );
  }

  /// `AiZere синтезирует ваш текст и восспроизводит с помощью голового интерфейса`
  String get aizereSpeechText {
    return Intl.message(
      'AiZere синтезирует ваш текст и восспроизводит с помощью голового интерфейса',
      name: 'aizereSpeechText',
      desc: '',
      args: [],
    );
  }

  /// `Нажмите воспроизвести`
  String get clickPlay {
    return Intl.message(
      'Нажмите воспроизвести',
      name: 'clickPlay',
      desc: '',
      args: [],
    );
  }

  /// `Библиотека`
  String get library {
    return Intl.message(
      'Библиотека',
      name: 'library',
      desc: '',
      args: [],
    );
  }

  /// `Начать`
  String get start {
    return Intl.message(
      'Начать',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Выберите язык`
  String get selectLanguage {
    return Intl.message(
      'Выберите язык',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Выбрать язык интерфейса, чтобы можно было читать и вводить текст на этом языке`
  String get selectLanguageInterface {
    return Intl.message(
      'Выбрать язык интерфейса, чтобы можно было читать и вводить текст на этом языке',
      name: 'selectLanguageInterface',
      desc: '',
      args: [],
    );
  }

  /// `Русский`
  String get russian {
    return Intl.message(
      'Русский',
      name: 'russian',
      desc: '',
      args: [],
    );
  }

  /// `Қазақша`
  String get kazakh {
    return Intl.message(
      'Қазақша',
      name: 'kazakh',
      desc: '',
      args: [],
    );
  }

  /// `Выберите спикера`
  String get chooseSpeaker {
    return Intl.message(
      'Выберите спикера',
      name: 'chooseSpeaker',
      desc: '',
      args: [],
    );
  }

  /// `Выбрать спикера, чтобы можно было воспроизвести аудио голосом опреденного спикера`
  String get chooseVoiceSpeaker {
    return Intl.message(
      'Выбрать спикера, чтобы можно было воспроизвести аудио голосом опреденного спикера',
      name: 'chooseVoiceSpeaker',
      desc: '',
      args: [],
    );
  }

  /// `Спикеры только на казахском языке`
  String get speakerOnlyKazakh {
    return Intl.message(
      'Спикеры только на казахском языке',
      name: 'speakerOnlyKazakh',
      desc: '',
      args: [],
    );
  }

  /// `Рая`
  String get raya {
    return Intl.message(
      'Рая',
      name: 'raya',
      desc: '',
      args: [],
    );
  }

  /// `Исеке`
  String get iseke {
    return Intl.message(
      'Исеке',
      name: 'iseke',
      desc: '',
      args: [],
    );
  }

  /// `Назад`
  String get back {
    return Intl.message(
      'Назад',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Продолжить`
  String get keepContinue {
    return Intl.message(
      'Продолжить',
      name: 'keepContinue',
      desc: '',
      args: [],
    );
  }

  /// `Голосовой помощник`
  String get voiceAssistant {
    return Intl.message(
      'Голосовой помощник',
      name: 'voiceAssistant',
      desc: '',
      args: [],
    );
  }

  /// `AizereVoice произносит названия объектов на экране. Вы можете управлять функцией AizereVoice с помощью простого набора жестов.`
  String get aizereVoiceTextOnScreen {
    return Intl.message(
      'AizereVoice произносит названия объектов на экране. Вы можете управлять функцией AizereVoice с помощью простого набора жестов.',
      name: 'aizereVoiceTextOnScreen',
      desc: '',
      args: [],
    );
  }

  /// `Скорость речи`
  String get voiceSpeed {
    return Intl.message(
      'Скорость речи',
      name: 'voiceSpeed',
      desc: '',
      args: [],
    );
  }

  /// `Взаимодействие`
  String get interaction {
    return Intl.message(
      'Взаимодействие',
      name: 'interaction',
      desc: '',
      args: [],
    );
  }

  /// `Настройка`
  String get setting {
    return Intl.message(
      'Настройка',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Специальные возможности`
  String get specialFeature {
    return Intl.message(
      'Специальные возможности',
      name: 'specialFeature',
      desc: '',
      args: [],
    );
  }

  /// `Язык`
  String get language {
    return Intl.message(
      'Язык',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Спикеры`
  String get speakers {
    return Intl.message(
      'Спикеры',
      name: 'speakers',
      desc: '',
      args: [],
    );
  }

  /// `Aizere`
  String get aizere {
    return Intl.message(
      'Aizere',
      name: 'aizere',
      desc: '',
      args: [],
    );
  }

  /// `Скорость воспроизведения`
  String get playbackSpeed {
    return Intl.message(
      'Скорость воспроизведения',
      name: 'playbackSpeed',
      desc: '',
      args: [],
    );
  }

  /// `Ваш текст`
  String get yourText {
    return Intl.message(
      'Ваш текст',
      name: 'yourText',
      desc: '',
      args: [],
    );
  }

  /// `Обычная`
  String get usual {
    return Intl.message(
      'Обычная',
      name: 'usual',
      desc: '',
      args: [],
    );
  }

  /// `Найти`
  String get toFind {
    return Intl.message(
      'Найти',
      name: 'toFind',
      desc: '',
      args: [],
    );
  }

  /// `Избранное`
  String get favorite {
    return Intl.message(
      'Избранное',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Вставить`
  String get paste {
    return Intl.message(
      'Вставить',
      name: 'paste',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'kk'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
