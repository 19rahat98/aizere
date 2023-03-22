import 'package:aizere_app/common/core/error/failures.dart';
import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/language_logic/data/models/language.dart';
import 'package:aizere_app/feature/language_logic/domain/repositories/language_logic_repository.dart';
import 'package:aizere_app/feature/settings/choose_local/data/pref/setting_locla_global_data_source.dart';
import 'package:dartz/dartz.dart';

class LanguageLogicRepositoryImpl implements LanguageLogicRepository {
  LanguageLogicRepositoryImpl() : _localDataSource = sl();

  final CoreGlobalSettingLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, LanguageEntity>> getConcreteLanguageCode(
    int langNumber,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<LanguageEntity> getDefaultLanguageCode() async {
    final langCode = await _localDataSource.isSelectedApplicationLocal;
    return LanguageEntity(
      code: langCode,
      value: langCode == 1 ? 'ru' : 'kk',
    );
  }
}
