import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';

import 'navigation_bar_item.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index) changeIndex;

  const CustomNavigationBar(
      {Key? key, required this.selectedIndex, required this.changeIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List icons = [
      AppIcons.icAizereBottom,
      AppIcons.icSearch,
      AppIcons.icHeart,
      AppIcons.icLibrary,
      AppIcons.icPerson,
    ];

    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.monoGrey),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          icons.length,
          (index) => NavigationBarItem(
            index: index,
            isSelected: selectedIndex == index,
            icon: icons.elementAt(index),
            changeIndex: changeIndex,
          ),
        ),
      ),
    );
  }
}
