import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    Key? key,
    required this.icon,
    required this.index,
    this.isSelected = false,
    required this.changeIndex,
  }) : super(key: key);

  final int index;
  final String icon;
  final bool isSelected;
  final void Function(int) changeIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => changeIndex(index),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(
          icon,
          width: 26,
          height: 26,
          fit: BoxFit.scaleDown,
          // ignore: deprecated_member_use
          color: isSelected ? AppColors.mainBlue : AppColors.monoGrey1,
        ),
      ),
    );
  }
}
