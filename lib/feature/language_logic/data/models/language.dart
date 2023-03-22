import 'package:aizere_app/feature/language_logic/domain/entities/language_model.dart';
import 'package:aizere_app/l10n/l10n.dart';

class LanguageEntity extends LanguageEntityModel {
  const LanguageEntity({
    required int code,
    required String value,
  }) : super(code: code, value: value);

  factory LanguageEntity.fromJson(Map<String, dynamic> json) {
    return LanguageEntity(
      code: json['code'] as int? ?? 1,
      value: json['value'].toString(),
    );
  }

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'code': code, 'value': value};
}

class Languages {
  const Languages._();

  static const languagesList = AppLocalizations.supportedLocales;

  static const languages = [
    LanguageEntity(code: 0, value: 'en'),
    LanguageEntity(code: 1, value: 'ru'),
    LanguageEntity(code: 2, value: 'kk'),
  ];
}
