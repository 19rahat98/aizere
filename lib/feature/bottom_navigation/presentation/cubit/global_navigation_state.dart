part of 'global_navigation_cubit.dart';

abstract class GlobalSwitchBottomBar {}

/// состояние редиректа по разделам bottomNavigator
class GlobalSwitchBottomBarPageState extends GlobalSwitchBottomBar {
  GlobalSwitchBottomBarPageState(
    this.pageIndex,
  );

  ///индекс раздела
  final int pageIndex;
}
