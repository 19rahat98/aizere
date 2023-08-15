import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';

class AppTitleWidget extends StatelessWidget {
  final String title;
  final String text;

  const AppTitleWidget({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyle.titleBig,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: AppTextStyle.body,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
