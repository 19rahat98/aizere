part of 'sign_in_cubit.dart';

abstract class SignInState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInCommonState extends SignInState {
  final bool isLoading;

  SignInCommonState({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];
}

class SignInSuccessState extends SignInState {}

class SignInFailureState extends SignInState {
  final String error;

  SignInFailureState(this.error);
}
