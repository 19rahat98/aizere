import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/auth/data/repository/auth_repository.dart';
import 'package:aizere_app/mixins/request_worker_mixin.dart';
import 'package:aizere_app/utils/exeption/exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> with CoreRequestWorkedMixin {
  SignUpCubit()
      : _authRepository = sl(),
        super(SignUpCommonState(isLoading: false)) {
    showErrorExceptionCallback = (error) {
      emit(SignUpFailureState());
    };
  }

  final AuthRepository _authRepository;

  void signUp(String username, String password, firstName) async {
    await launchWithAuthError<void, GlobalAuthException>(
      request: _authRepository.signUp(username, password, firstName),
      loading: (isLoading) => emit(
        SignUpCommonState(isLoading: isLoading),
      ),
      resultData: (data) {
        emit(SignUpSuccessState());
      },
      errorData: (errorData) => emit(
        SignUpFailureState(
          errorMessage: errorData.message ??
              errorData.email?.first ??
              errorData.password?.first ??
              errorData.name?.first,
        ),
      ),
    );
  }

  void emailConfirmation(String username, String code) async {
    await launchWithError<String, GlobalAuthException>(
      request: _authRepository.emailConfirmation(username, code),
      loading: (isLoading) => emit(
        SignUpCommonState(isLoading: isLoading),
      ),
      resultData: (data) => emit(
        EmailConfirmSuccessState(),
      ),
      errorData: (errorData) => emit(
        SignUpFailureState(
          errorMessage: errorData.message ??
              errorData.email?.first ??
              errorData.password?.first ??
              errorData.name?.first,
        ),
      ),
    );
  }

  Future<bool> logOut() async {
    return await _authRepository.logOut();
  }
}
