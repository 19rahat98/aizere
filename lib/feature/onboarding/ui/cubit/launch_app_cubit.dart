import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/onboarding/domain/usecase/global_launcher_usercase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'launch_app_state.dart';

class LaunchAppCubit extends Cubit<LaunchAppState> {
  LaunchAppCubit()
      : _actionInputApplicationUseCase = sl(),
        super(LaunchAppInitial());

  final GlobalCheckTokenConstrainUseCase _actionInputApplicationUseCase;

  /// запрашиваем у сервера наличие обновления
  Future<void> checkOnboardingStatus() async {
    final launchData = await _actionInputApplicationUseCase.execute();

    if (launchData) {
      emit(LaunchAppCommonState());
    } else {
      emit(FirstLaunchState());
    }
  }
}
