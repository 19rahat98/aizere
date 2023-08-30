import 'package:aizere_app/common/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UserCase<Type, Parameter>{
  Future<Either<Failure, Type>> call(Parameter param);
}

abstract class UseCaseNonParam<Result>{
  Future<Result> call();
}




class NoParams extends Equatable{
  @override
  List<Object?> get props => throw UnimplementedError();
}