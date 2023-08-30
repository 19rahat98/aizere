import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/auth/data/repository/auth_repository.dart';
import 'package:aizere_app/mixins/request_worker_mixin.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> with CoreRequestWorkedMixin {
  SignInCubit()
      : _authRepository = sl(),
        super(SignInCommonState(isLoading: false));

  final AuthRepository _authRepository;

  void signIn(String username, String password) async {
    await launchWithError(
      request: _authRepository.signIn(username, password),
      resultData: (data) {
        emit(SignInSuccessState());
      },
      loading: (isLoading) => emit(SignInCommonState(isLoading: true)),
      errorData: (errorData) {
        emit(SignInFailureState(errorData.toString()));
      },
    );
  }
}
