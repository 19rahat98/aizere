import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
