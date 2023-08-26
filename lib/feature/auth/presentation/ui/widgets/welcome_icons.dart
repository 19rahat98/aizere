import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeIcons extends StatelessWidget {
  const WelcomeIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppIcons.icAizere),
        const SizedBox(
          height: 20,
        ),
        SvgPicture.asset(AppIcons.icPet),
      ],
    );
  }
}
