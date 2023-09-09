import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    Key? key,
    this.onTap,
    this.style,
    this.padding,
    required this.text,
    this.isCenter = true,
  }) : super(key: key);

  final String text;
  final bool isCenter;
  final VoidCallback? onTap;
  final TextStyle? style;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: padding ?? EdgeInsets.zero,
      ),
      child: getBody(),
    );
  }

  Widget getBody() {
    if (isCenter) {
      return Center(
        child: Text(
          text,
          style: style ?? AppTextStyle.textButtonStyle,
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      );
    }
    return Text(
      text,
      style: style ?? AppTextStyle.textButtonStyle,
      textAlign: TextAlign.center,
      maxLines: 1,
    );
  }
}
