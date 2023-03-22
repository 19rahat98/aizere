import 'package:aizere_app/common/core/error/failures.dart';
import 'package:aizere_app/common/core/usecases.dart';
import 'package:aizere_app/feature/language_logic/data/repositories/language_logic_repository_impl.dart';
import 'package:aizere_app/feature/language_logic/domain/entities/language_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetConcreteLanguageCode implements UserCase<LanguageEntityModel, Params> {
  GetConcreteLanguageCode(this.repository);

  final LanguageLogicRepositoryImpl repository;

  @override
  Future<Either<Failure, LanguageEntityModel>> call(Params params) async =>
      repository.getConcreteLanguageCode(params.languageCode);
}

class Params extends Equatable {
  const Params({required this.languageCode}) : super();

  final int languageCode;

  @override
  List<Object?> get props => [
    languageCode,
  ];
}
