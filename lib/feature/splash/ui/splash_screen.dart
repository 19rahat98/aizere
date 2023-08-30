import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/splash/cubit/splash_cubit.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class AppSplashScreen extends StatelessWidget {
  const AppSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..checkTokenAndNavigate(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is AppSplashAuthenticated) {
            context.router.replace(SpeechSynthesisBuildRoute());
          } else if (state is AppSplashUnauthenticated) {
            context.router.replace(const WelcomeRoute());
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.mainBlue,
          body: Center(
            child: SvgPicture.asset(
              AppIcons.icAizere,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
