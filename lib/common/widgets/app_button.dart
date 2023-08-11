import 'package:aizere_app/config/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final bool? isExpanded;
  final Color? color;
  final void Function()? onPressed;
  final double? radius;
  final Color? textColor;
  final double? margin;

  const AppButton({
    Key? key,
    required this.text,
    this.isExpanded = false,
    this.color,
    this.onPressed,
    this.radius,
    this.textColor,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin ?? 0),
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: color ?? AppColors.mainBlue,
        borderRadius: BorderRadius.circular(radius ?? 12),
      ),
      child: CupertinoButton(
        minSize: 0,
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Text(
          text,
          style:
              AppTextStyle.w600s17.copyWith(color: textColor ?? Colors.white),
        ),
      ),
    );
  }
}
