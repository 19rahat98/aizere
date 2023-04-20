import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/bottom_navigation/presentation/cubit/global_navigation_cubit.dart';
import 'package:aizere_app/feature/bottom_navigation/presentation/ui/widgets/nav_bar_icon_item_widget.dart';
import 'package:aizere_app/feature/favorites/presentation/ui/favorites_screen.dart';
import 'package:aizere_app/feature/library/presentation/ui/library_screen.dart';
import 'package:aizere_app/feature/search/presentation/ui/search_screen.dart';
import 'package:aizere_app/feature/speech_synthesis/presentation/ui/speech_synthesis_screen.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

/// нижнее меню
class MainBottomBarWidget extends StatefulWidget {
  const MainBottomBarWidget({Key? key}) : super(key: key);

  @override
  State<MainBottomBarWidget> createState() => _MainBottomBarWidgetState();
}

class _MainBottomBarWidgetState extends State<MainBottomBarWidget> {
  late GlobalNavigationCubit _cubit;
  late PersistentTabController _controller;

  /// экраны нижней навишации
  final List<Widget> _screens = [
    const SpeechSynthesisBuild(),
    const SearchScreen(),
    const FavoritesScreen(),
    const LibraryScreen(),
  ];

  /// табы нижней навигации
  List<PersistentBottomNavBarItem> get _tabs => [
        PersistentBottomNavBarItem(
          icon: NavBarIconItemWidget(
            title: context.l10n.aizere,
            iconName: AppIcons.icAizereBottom,
            iconColor: AppColors.mainBlue,
            textColor: AppColors.mainBlue,
          ),
          inactiveIcon: NavBarIconItemWidget(
            title: context.l10n.aizere,
            iconName: AppIcons.icAizereBottom,
            iconColor: AppColors.monoGrey1,
            textColor: AppColors.monoGrey1,
          ),
        ),
        PersistentBottomNavBarItem(
          icon: NavBarIconItemWidget(
            title: context.l10n.toFind,
            iconName: AppIcons.icSearch,
            iconColor: AppColors.mainBlue,
            textColor: AppColors.mainBlue,
          ),
          inactiveIcon: NavBarIconItemWidget(
            title: context.l10n.toFind,
            iconName: AppIcons.icSearch,
            iconColor: AppColors.monoGrey1,
            textColor: AppColors.monoGrey1,
          ),
        ),
        PersistentBottomNavBarItem(
          icon: NavBarIconItemWidget(
            title: context.l10n.favorite,
            iconName: AppIcons.icHeart,
            iconColor: AppColors.mainBlue,
            textColor: AppColors.mainBlue,
          ),
          inactiveIcon: NavBarIconItemWidget(
            title: context.l10n.favorite,
            iconName: AppIcons.icHeart,
            iconColor: AppColors.monoGrey1,
            textColor: AppColors.monoGrey1,
          ),
        ),
        PersistentBottomNavBarItem(
          icon: NavBarIconItemWidget(
            title: context.l10n.library,
            iconName: AppIcons.icLibrary,
            iconColor: AppColors.mainBlue,
            textColor: AppColors.mainBlue,
          ),
          inactiveIcon: NavBarIconItemWidget(
            title: context.l10n.library,
            iconName: AppIcons.icLibrary,
            iconColor: AppColors.monoGrey1,
            textColor: AppColors.monoGrey1,
          ),
        ),
      ];

  @override
  void initState() {
    _controller = PersistentTabController();
    _cubit = context.read<GlobalNavigationCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GlobalNavigationCubit, GlobalSwitchBottomBar>(
      listener: (_, state) {
        if (state is GlobalSwitchBottomBarPageState) {
          if (_controller.index != state.pageIndex) {
            _controller.jumpToTab(state.pageIndex);
          }
        }
      },
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _screens,
        items: _tabs,
        onItemSelected: (index) {
          _cubit.switchBottomBarPage(index);
        },
        padding: const NavBarPadding.only(
          top: 10,
          bottom: 0,
        ),
        selectedTabScreenContext: (context) {},
        navBarHeight: 60,
        resizeToAvoidBottomInset: true,
        hideNavigationBarWhenKeyboardShows: false,
        backgroundColor: Colors.white.withOpacity(0.94),
        decoration: NavBarDecoration(
          border: Border.all(
            width: 0.5,
            color: const Color(0xFFD5D5D5),
          ),
        ),
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        navBarStyle: NavBarStyle.style2,
      ),
    );
  }
}
