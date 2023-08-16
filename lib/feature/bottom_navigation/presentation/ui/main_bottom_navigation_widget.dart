import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
