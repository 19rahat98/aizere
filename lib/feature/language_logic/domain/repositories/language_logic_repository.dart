import 'package:aizere_app/common/core/error/failures.dart';
import 'package:aizere_app/feature/language_logic/domain/entities/language_model.dart';
import 'package:dartz/dartz.dart';

abstract class LanguageLogicRepository{
  Future<Either<Failure, LanguageEntityModel>>
    getConcreteLanguageCode(int langNumber);
  Future<LanguageEntityModel> getDefaultLanguageCode();
}