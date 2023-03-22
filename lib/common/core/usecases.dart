import 'package:aizere_app/common/core/error/failures.dart';
import 'package:aizere_app/feature/language_logic/domain/entities/language_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UserCase<Type, Parameter>{
  Future<Either<Failure, LanguageEntityModel>> call(Parameter param);
}

abstract class UseCaseNonParam<Result>{
  Future<Result> call();
}


class NoParams extends Equatable{
  @override
  List<Object?> get props => throw UnimplementedError();
}