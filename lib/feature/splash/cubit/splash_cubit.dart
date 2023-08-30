import 'package:aizere_app/common/constants/global_pref_constant.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const AppSplashInitial());

  Future<void> checkTokenAndNavigate() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(GlobalPrefConstant.prefAccessToken);

    if (token != null) {
      emit(const AppSplashAuthenticated());
    } else {
      emit(const AppSplashUnauthenticated());
    }
  }
}
