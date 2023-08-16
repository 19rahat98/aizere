import 'package:aizere_app/common/widgets/ignore_double_tap_mixim.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';

/// кнопка с заполненным цветом
class AppFilledColorButton extends StatelessWidget with IgnoreDoubleTapMixin {
  AppFilledColorButton({
    Key? key,
    this.height,
    this.child,
    this.width,
    this.onTap,
    this.borderRadiusRadii = 12,
    this.padding,
    this.margin,
    this.color,
    this.text, this.textColor,
  }) : super(key: key);

  /// дочерний элемент
  final Widget? child;

  /// ширина
  final double? width;

  /// высота
  final double? height;

  /// внутреннний отступ
  final EdgeInsetsGeometry? padding;

  /// внешний отступ
  final EdgeInsetsGeometry? margin;

  /// округление фигуры
  final double borderRadiusRadii;

  final Color? color;

  /// обратный вызов при нажатии на виджет
  final GestureTapCallback? onTap;

  /// используется когда нам не нужен child, исключительно текст.
  final String? text;

  /// Задавать цвет текста.
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadiusRadii),
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          if (!isRedundantClick) {
            onTap?.call();
          }
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: padding ?? EdgeInsets.zero,
          backgroundColor: color ?? AppColors.mainBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusRadii),
          ),
        ),
        child: text != null
            ? Center(
                child: Text(
                  text!,
                  style: AppTextStyle.w600s17.copyWith(color: textColor ?? Colors.white),
                ),
              )
            : child,
      ),
    );
  }
}
