import 'package:aizere_app/common/core/usecases.dart';
import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/language_logic/data/models/language.dart';
import 'package:aizere_app/feature/language_logic/data/repositories/language_logic_repository_impl.dart';

class GetDefaultLanguageCode
    implements UseCaseNonParam<LanguageEntity> {
  GetDefaultLanguageCode() : _repository = sl();

  final LanguageLogicRepositoryImpl _repository;

  @override
  Future<LanguageEntity> call() async {
    return _repository.getDefaultLanguageCode();
  }
}
