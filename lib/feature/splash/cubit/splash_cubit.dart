import 'package:aizere_app/common/constants/global_pref_constant.dart';
import 'package:aizere_app/di/di_locator.dart';
import 'package:aizere_app/feature/onboarding/domain/usecase/global_launcher_usercase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit()
      : _actionInputApplicationUseCase = sl(),
        super(const AppSplashInitial());

  Future<void> checkTokenAndNavigate() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(GlobalPrefConstant.prefAccessToken);

    if (token != null) {
      emit(const AppSplashAuthenticated());
    } else {
      emit(const AppSplashUnauthenticated());
      checkOnboardignStatus();
    }
  }

  final GlobalMakeActionInputApplicationUseCase _actionInputApplicationUseCase;

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
