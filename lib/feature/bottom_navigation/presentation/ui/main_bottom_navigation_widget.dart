import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// нижнее меню
// class MainBottomBarWidget extends StatefulWidget {
//   const MainBottomBarWidget({Key? key}) : super(key: key);
//
//   @override
//   State<MainBottomBarWidget> createState() => _MainBottomBarWidgetState();
// }
//
// class _MainBottomBarWidgetState extends State<MainBottomBarWidget> {
//   late GlobalNavigationCubit _cubit;
//   late PersistentTabController _controller;
//
//   /// экраны нижней навишации
//   final List<Widget> _screens = [
//     const SpeechSynthesisBuild(),
//     const SearchScreen(),
//     const FavoritesScreen(),
//     const LibraryScreen(),
//   ];
//
//   /// табы нижней навигации
//   List<PersistentBottomNavBarItem> get _tabs => [
//         PersistentBottomNavBarItem(
//           icon: NavBarIconItemWidget(
//             title: context.l10n.aizere,
//             iconName: AppIcons.icAizereBottom,
//             iconColor: AppColors.mainBlue,
//             textColor: AppColors.mainBlue,
//           ),
//           inactiveIcon: NavBarIconItemWidget(
//             title: context.l10n.aizere,
//             iconName: AppIcons.icAizereBottom,
//             iconColor: AppColors.monoGrey1,
//             textColor: AppColors.monoGrey1,
//           ),
//         ),
//         PersistentBottomNavBarItem(
//           icon: NavBarIconItemWidget(
//             title: context.l10n.toFind,
//             iconName: AppIcons.icSearch,
//             iconColor: AppColors.mainBlue,
//             textColor: AppColors.mainBlue,
//           ),
//           inactiveIcon: NavBarIconItemWidget(
//             title: context.l10n.toFind,
//             iconName: AppIcons.icSearch,
//             iconColor: AppColors.monoGrey1,
//             textColor: AppColors.monoGrey1,
//           ),
//         ),
//         PersistentBottomNavBarItem(
//           icon: NavBarIconItemWidget(
//             title: context.l10n.favorite,
//             iconName: AppIcons.icHeart,
//             iconColor: AppColors.mainBlue,
//             textColor: AppColors.mainBlue,
//           ),
//           inactiveIcon: NavBarIconItemWidget(
//             title: context.l10n.favorite,
//             iconName: AppIcons.icHeart,
//             iconColor: AppColors.monoGrey1,
//             textColor: AppColors.monoGrey1,
//           ),
//         ),
//         PersistentBottomNavBarItem(
//           icon: NavBarIconItemWidget(
//             title: context.l10n.library,
//             iconName: AppIcons.icLibrary,
//             iconColor: AppColors.mainBlue,
//             textColor: AppColors.mainBlue,
//           ),
//           inactiveIcon: NavBarIconItemWidget(
//             title: context.l10n.library,
//             iconName: AppIcons.icLibrary,
//             iconColor: AppColors.monoGrey1,
//             textColor: AppColors.monoGrey1,
//           ),
//         ),
//       ];
//
//   @override
//   void initState() {
//     _controller = PersistentTabController();
//     _cubit = context.read<GlobalNavigationCubit>();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<GlobalNavigationCubit, GlobalSwitchBottomBar>(
//       listener: (_, state) {
//         if (state is GlobalSwitchBottomBarPageState) {
//           if (_controller.index != state.pageIndex) {
//             _controller.jumpToTab(state.pageIndex);
//           }
//         }
//       },
//       child: PersistentTabView(
//         context,
//         controller: _controller,
//         screens: _screens,
//         items: _tabs,
//         onItemSelected: (index) {
//           _cubit.switchBottomBarPage(index);
//         },
//         padding: const NavBarPadding.only(
//           top: 10,
//           bottom: 0,
//         ),
//         selectedTabScreenContext: (context) {},
//         navBarHeight: 60,
//         resizeToAvoidBottomInset: true,
//         hideNavigationBarWhenKeyboardShows: false,
//         backgroundColor: Colors.white.withOpacity(0.94),
//         decoration: NavBarDecoration(
//           border: Border.all(
//             width: 0.5,
//             color: const Color(0xFFD5D5D5),
//           ),
//         ),
//         itemAnimationProperties: const ItemAnimationProperties(
//           duration: Duration(milliseconds: 200),
//           curve: Curves.ease,
//         ),
//         navBarStyle: NavBarStyle.style2,
//       ),
//     );
//   }
// }

@RoutePage()
class MainBottomNavigationScreen extends StatefulWidget {
  const MainBottomNavigationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainBottomNavigationScreen> createState() =>
      _MainBottomNavigationScreenState();
}

class _MainBottomNavigationScreenState
    extends State<MainBottomNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        SpeechSynthesisBuildRoute(),
        const SearchRoute(),
        const FavoritesRoute(),
        const LibraryRoute(),
      ],
      lazyLoad: false,
      homeIndex: 0,
      // не знаю какую продолжительность поставить, 0 кажется самое грамотное
      animationDuration: const Duration(milliseconds: 0),
      backgroundColor: Colors.white,
      bottomNavigationBuilder: (context, tabsRouter) {
        return CustomNavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          changeIndex: (index) {
            setState(
              () {
                index != tabsRouter.activeIndex
                    ? tabsRouter.setActiveIndex(index)
                    : context.router.canPop()
                        ? context.router.popTop()
                        : null;
              },
            );
          },
        );
      },
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index) changeIndex;

  const CustomNavigationBar(
      {Key? key, required this.selectedIndex, required this.changeIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> map = {
      context.l10n.aizere: AppIcons.icAizereBottom,
      context.l10n.toFind: AppIcons.icSearch,
      context.l10n.favorite: AppIcons.icHeart,
      context.l10n.library: AppIcons.icLibrary,
    };

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.ffEDEDED),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          map.length,
          (index) => NavigationBarItem(
            index: index,
            isSelected: selectedIndex == index,
            icon: map.values.elementAt(index),
            title: map.keys.elementAt(index),
            changeIndex: changeIndex,
          ),
        ),
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  final void Function(int index) changeIndex;
  final int index;

  const NavigationBarItem(
      {Key? key,
      required this.title,
      required this.icon,
      this.isSelected = false,
      required this.changeIndex,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () => changeIndex(index),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: SvgPicture.asset(
          icon,
          width: 50,
          height: 50,
          fit: BoxFit.scaleDown,
          // ignore: deprecated_member_use
          color: isSelected ? AppColors.mainBlue : AppColors.monoGrey1,
        ),
      ),
    );
  }
}
