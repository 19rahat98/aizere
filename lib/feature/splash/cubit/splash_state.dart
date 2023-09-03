part of 'splash_cubit.dart';

@immutable
abstract class SplashState {
  const SplashState();
}

class AppSplashInitial extends SplashState {
  const AppSplashInitial();
}

class AppSplashAuthenticated extends SplashState {
  const AppSplashAuthenticated();
}

class AppSplashUnauthenticated extends SplashState {
  const AppSplashUnauthenticated();
}

class LaunchAppInitial extends SplashState {}

class FirstLaunchState extends SplashState {}

class SettingsLaunchState extends SplashState {}

class LaunchAppCommonState extends SplashState {}