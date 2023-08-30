import 'package:aizere_app/common/widgets/keyboard_dismisser.dart';
import 'package:flutter/material.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({
    Key? key,
    required this.body,
    this.backGround,
    this.appBar,
    this.top = true,
    this.bottom = true,
  }) : super(key: key);

  final bool top;
  final bool bottom;
  final Widget body;
  final Color? backGround;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backGround ?? Colors.white,
      child: KeyboardDismisser(
        child: SafeArea(
          top: top,
          bottom: bottom,
          child: Scaffold(
            body: body,
            appBar: appBar,
            backgroundColor: backGround ?? Colors.white,

          ),
        ),
      ),
    );
  }
}
