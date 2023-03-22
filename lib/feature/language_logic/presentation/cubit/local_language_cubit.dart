import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/language_logic/data/models/language.dart';
import 'package:aizere_app/feature/language_logic/domain/usecase/get_default_language_code_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'local_language_state.dart';

class LocalLanguageCubit extends Cubit<LocalLanguageState> {
  LocalLanguageCubit()
      : _defaultLanguageCode = sl(),
        super(LocalLanguageInitial());

  final GetDefaultLanguageCode _defaultLanguageCode;

  Future<void> getLanguageCode() async {
    final value = await _defaultLanguageCode.call();
    changeLocalApp(value);
  }

  void changeLocalApp(LanguageEntity locale) {
    emit(LanguageLoaded(Locale(locale.value ?? 'ru')));
  }
}
