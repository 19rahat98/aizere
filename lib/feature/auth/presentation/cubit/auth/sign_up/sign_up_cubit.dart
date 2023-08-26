import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/auth/data/repository/auth_repository.dart';
import 'package:aizere_app/mixins/request_worker_mixin.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> with CoreRequestWorkedMixin {
  SignUpCubit()
      : _authRepository = sl(),
        super(SignUpCommonState(isLoading: false));

  final AuthRepository _authRepository;

  void signUp(String username, String password, firstName) async {
    await launchWithError(
      request: _authRepository.signUp(username, password, firstName),
      resultData: (data) {
        emit(SignUpSuccessState());
      },
      loading: (isLoading) => emit(SignUpCommonState(isLoading: true)),
      errorData: (errorData) {
        emit(SignUpFailureState());
      },
    );
  }

  void emailConfirmation(String username, String code) async {
    await launchWithError(
      request: _authRepository.(username, code),
      resultData: (data) {
        emit(SignUpSuccessState());
      },
      loading: (isLoading) => emit(SignUpCommonState(isLoading: true)),
      errorData: (errorData) {
        emit(SignUpFailureState());
      },
    );
  }
}
