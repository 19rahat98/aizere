import 'package:aizere_app/common/constants/global_pref_constant.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class AppSplashScreen extends StatefulWidget {
  const AppSplashScreen({Key? key}) : super(key: key);

  @override
  State<AppSplashScreen> createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends State<AppSplashScreen> {
  @override
  void initState() {
    _checkTokenAndNavigate();
    super.initState();
  }

  Future<void> _checkTokenAndNavigate() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(GlobalPrefConstant.prefAccessToken);

    if (context.mounted) {
      if (token != null) {
        context.router.replace(SpeechSynthesisBuildRoute());
      } else {
        context.router.replace(const WelcomeRoute());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBlue,
      body: Center(
        child: SvgPicture.asset(
          AppIcons.icAizere,
          color: Colors.white,
        ),
      ),
    );
  }
}
