import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';

class AppCommonDividerWidget extends StatelessWidget {
  const AppCommonDividerWidget({
    Key? key,
    this.color,
    this.height,
    this.thickness,
    this.indentValue,
  }) : super(key: key);

  /// цвет виджета
  final Color? color;

  /// отступ с края
  final double? indentValue;

  final double? height;

  /// толщина дивайдера
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness ?? 1,
      height: height ?? 0,
      endIndent: indentValue ?? 0,
      indent: indentValue ?? 0,
      color: color ?? AppColors.monoGrey,
    );
  }
}
