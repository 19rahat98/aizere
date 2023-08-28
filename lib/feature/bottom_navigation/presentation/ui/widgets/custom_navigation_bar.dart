import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/l10n/l10n.dart';
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
    Map<String, dynamic> map = {
      context.l10n.aizere: AppIcons.icAizereBottom,
      context.l10n.toFind: AppIcons.icSearch,
      context.l10n.favorite: AppIcons.icHeart,
      context.l10n.library: AppIcons.icLibrary,
    };

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.monoGrey),
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
