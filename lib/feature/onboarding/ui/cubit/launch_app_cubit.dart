import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/onboarding/domain/usecase/global_launcher_usercase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'launch_app_state.dart';

class LaunchAppCubit extends Cubit<LaunchAppState> {
  LaunchAppCubit()
      : _actionInputApplicationUseCase = sl(),
        super(LaunchAppInitial());

  final GlobalMakeActionInputApplicationUseCase _actionInputApplicationUseCase;

  /// запрашиваем у сервера наличие обновления
  Future<void> checkOnboardignStatus() async {
    final launchData = await _actionInputApplicationUseCase.execute();

    if (!launchData.isBeforeOpenApplication) {
      emit(FirstLaunchState());
    } else if (!launchData.isBeforeSetting) {
      emit(SettingsLaunchState());
    } else {
      emit(LaunchAppCommonState());
    }
  }
}
