import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSplashScreen extends StatelessWidget {
  const AppSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBlack,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 60,
        ),
        child: Center(
          child: SvgPicture.asset(
            AppIcons.icLogo,
          ),
        ),
      ),
    );
  }
}
