import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/onboarding/ui/cubit/launch_app_cubit.dart';
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
    return BlocProvider<LaunchAppCubit>(
      create: (_) => LaunchAppCubit()..checkOnboardingStatus(),
      child: BlocListener<LaunchAppCubit, LaunchAppState>(
        listener: (context, state) {
          if (state is FirstLaunchState) {
            context.router.replace(
              const OnboardingRoute(),
            );
          } else if (state is LaunchAppCommonState) {
            context.router.replace(
              SpeechSynthesisBuildRoute(),
            );
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
