import 'package:aizere_app/common/constants/global_navigation_constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'global_navigation_state.dart';

/// обработчик для переключения табов в главном BottomBar
class GlobalNavigationCubit extends Cubit<GlobalSwitchBottomBar> {
  GlobalNavigationCubit()
    : super(
        GlobalSwitchBottomBarPageState(
          GlobalNavigationConstant.home,
        ),
      );

  /// метод переключение табов
  void switchBottomBarPage(int page) {
    emit(GlobalSwitchBottomBarPageState(page));
  }
}
