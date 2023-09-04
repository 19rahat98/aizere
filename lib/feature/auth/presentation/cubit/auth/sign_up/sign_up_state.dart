part of 'sign_up_cubit.dart';

abstract class SignUpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpCommonState extends SignUpState {
  final bool isLoading;

  SignUpCommonState({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class SignUpSuccessState extends SignUpState {}

class SignUpFailureState extends SignUpState {
  SignUpFailureState({this.errorMessage});

  final String? errorMessage;

  @override
  List<Object> get props => [errorMessage ?? 0];
}

class EmailConfirmSuccessState extends SignUpState {}
