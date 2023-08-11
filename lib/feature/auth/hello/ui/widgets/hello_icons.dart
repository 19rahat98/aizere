import 'package:aizere_app/common/constants/global_file_extension_constant.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HelloIcons extends StatelessWidget {
  const HelloIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppIcons.icAizere),
        40.h,
        SvgPicture.asset(AppIcons.icPet),
      ],
    );
  }
}
