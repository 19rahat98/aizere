import 'package:aizere_app/feature/bottom_navigation/presentation/ui/main_bottom_navigation_widget.dart';
import 'package:aizere_app/feature/onboarding/ui/cubit/launch_app_cubit.dart';
import 'package:aizere_app/feature/onboarding/ui/onboarding_screen.dart';
import 'package:aizere_app/feature/settings/choose_local/presentation/ui/choose_locale_screen.dart';
import 'package:aizere_app/feature/splash/ui/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaunchAppPage extends StatelessWidget {
  const LaunchAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LaunchAppCubit>(
      create: (_) => LaunchAppCubit()..checkOnboardignStatus(),
      child: const LaunchAppScreen(),
    );
  }
}

class LaunchAppScreen extends StatefulWidget {
  const LaunchAppScreen({Key? key}) : super(key: key);

  @override
  State<LaunchAppScreen> createState() => _LaunchAppScreenState();
}

class _LaunchAppScreenState extends State<LaunchAppScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaunchAppCubit, LaunchAppState>(
      listener: (context, state) {
        print(state);
      },
      builder: (context, state) {
        if (state is FirstLaunchState) {
          return const OnboardingScreen();
        } else if (state is SettingsLaunchState) {
          return const ChooseLocale();
        } else if (state is LaunchAppCommonState) {
          return const MainBottomBarWidget();
        }

        return const AppSplashScreen();
      },
    );
  }
}
