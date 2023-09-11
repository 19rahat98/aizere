// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AccountDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountDetailsScreen(),
      );
    },
    AizereEmptyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AizereEmptyScreen(),
      );
    },
    AppSplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppSplashScreen(),
      );
    },
    ChangeLanguageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChangeLanguageScreen(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChangePasswordScreen(),
      );
    },
    ChooseInterfaceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChooseInterfaceScreen(),
      );
    },
    ChooseLocaleRoute.name: (routeData) {
      final args = routeData.argsAs<ChooseLocaleRouteArgs>(
          orElse: () => const ChooseLocaleRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChooseLocaleScreen(
          key: args.key,
          isStartSetting: args.isStartSetting,
        ),
      );
    },
    ConfirmationRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ConfirmationScreen(
          key: args.key,
          name: args.name,
          username: args.username,
          isForgotPass: args.isForgotPass,
        ),
      );
    },
    DeleteAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DeleteAccountScreen(),
      );
    },
    EmptyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmptyScreen(),
      );
    },
    FavoriteEmptyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoriteEmptyScreen(),
      );
    },
    FavoritesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoritesScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordScreen(),
      );
    },
    LibraryEmptyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LibraryEmptyScreen(),
      );
    },
    LibraryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LibraryScreen(),
      );
    },
    MainBottomNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainBottomNavigationScreen(),
      );
    },
    NotificationsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationsScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    PlayerRoute.name: (routeData) {
      final args = routeData.argsAs<PlayerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PlayerScreen(
          key: args.key,
          initialIndex: args.initialIndex,
          classCompositions: args.classCompositions,
        ),
      );
    },
    ProfileEmptyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileEmptyScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfileScreen(key: args.key),
      );
    },
    RegistrationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegistrationScreen(),
      );
    },
    SearchEmptyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchEmptyScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInScreen(),
      );
    },
    SpeechSynthesisBuildRoute.name: (routeData) {
      final args = routeData.argsAs<SpeechSynthesisBuildRouteArgs>(
          orElse: () => const SpeechSynthesisBuildRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SpeechSynthesisBuildScreen(
          key: args.key,
          text: args.text,
        ),
      );
    },
    SpeechSynthesisResultRoute.name: (routeData) {
      final args = routeData.argsAs<SpeechSynthesisResultRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SpeechSynthesisResultScreen(
          key: args.key,
          audioPath: args.audioPath,
          text: args.text,
        ),
      );
    },
    SuccessRoute.name: (routeData) {
      final args = routeData.argsAs<SuccessRouteArgs>(
          orElse: () => const SuccessRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SuccessScreen(
          key: args.key,
          name: args.name,
          isNewPassword: args.isNewPassword,
        ),
      );
    },
    SupportRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SupportScreen(),
      );
    },
    VoiceAssistantRoute.name: (routeData) {
      final args = routeData.argsAs<VoiceAssistantRouteArgs>(
          orElse: () => const VoiceAssistantRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VoiceAssistantScreen(
          key: args.key,
          isStartSetting: args.isStartSetting,
        ),
      );
    },
    WelcomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WelcomeScreen(),
      );
    },
  };
}

/// generated route for
/// [AccountDetailsScreen]
class AccountDetailsRoute extends PageRouteInfo<void> {
  const AccountDetailsRoute({List<PageRouteInfo>? children})
      : super(
          AccountDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AizereEmptyScreen]
class AizereEmptyRoute extends PageRouteInfo<void> {
  const AizereEmptyRoute({List<PageRouteInfo>? children})
      : super(
          AizereEmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'AizereEmptyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AppSplashScreen]
class AppSplashRoute extends PageRouteInfo<void> {
  const AppSplashRoute({List<PageRouteInfo>? children})
      : super(
          AppSplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppSplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChangeLanguageScreen]
class ChangeLanguageRoute extends PageRouteInfo<void> {
  const ChangeLanguageRoute({List<PageRouteInfo>? children})
      : super(
          ChangeLanguageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangeLanguageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChangePasswordScreen]
class ChangePasswordRoute extends PageRouteInfo<void> {
  const ChangePasswordRoute({List<PageRouteInfo>? children})
      : super(
          ChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChooseInterfaceScreen]
class ChooseInterfaceRoute extends PageRouteInfo<void> {
  const ChooseInterfaceRoute({List<PageRouteInfo>? children})
      : super(
          ChooseInterfaceRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseInterfaceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChooseLocaleScreen]
class ChooseLocaleRoute extends PageRouteInfo<ChooseLocaleRouteArgs> {
  ChooseLocaleRoute({
    Key? key,
    bool isStartSetting = true,
    List<PageRouteInfo>? children,
  }) : super(
          ChooseLocaleRoute.name,
          args: ChooseLocaleRouteArgs(
            key: key,
            isStartSetting: isStartSetting,
          ),
          initialChildren: children,
        );

  static const String name = 'ChooseLocaleRoute';

  static const PageInfo<ChooseLocaleRouteArgs> page =
      PageInfo<ChooseLocaleRouteArgs>(name);
}

class ChooseLocaleRouteArgs {
  const ChooseLocaleRouteArgs({
    this.key,
    this.isStartSetting = true,
  });

  final Key? key;

  final bool isStartSetting;

  @override
  String toString() {
    return 'ChooseLocaleRouteArgs{key: $key, isStartSetting: $isStartSetting}';
  }
}

/// generated route for
/// [ConfirmationScreen]
class ConfirmationRoute extends PageRouteInfo<ConfirmationRouteArgs> {
  ConfirmationRoute({
    Key? key,
    String? name,
    required String username,
    bool isForgotPass = false,
    List<PageRouteInfo>? children,
  }) : super(
          ConfirmationRoute.name,
          args: ConfirmationRouteArgs(
            key: key,
            name: name,
            username: username,
            isForgotPass: isForgotPass,
          ),
          initialChildren: children,
        );

  static const String name = 'ConfirmationRoute';

  static const PageInfo<ConfirmationRouteArgs> page =
      PageInfo<ConfirmationRouteArgs>(name);
}

class ConfirmationRouteArgs {
  const ConfirmationRouteArgs({
    this.key,
    this.name,
    required this.username,
    this.isForgotPass = false,
  });

  final Key? key;

  final String? name;

  final String username;

  final bool isForgotPass;

  @override
  String toString() {
    return 'ConfirmationRouteArgs{key: $key, name: $name, username: $username, isForgotPass: $isForgotPass}';
  }
}

/// generated route for
/// [DeleteAccountScreen]
class DeleteAccountRoute extends PageRouteInfo<void> {
  const DeleteAccountRoute({List<PageRouteInfo>? children})
      : super(
          DeleteAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeleteAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EmptyScreen]
class EmptyRoute extends PageRouteInfo<void> {
  const EmptyRoute({List<PageRouteInfo>? children})
      : super(
          EmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FavoriteEmptyScreen]
class FavoriteEmptyRoute extends PageRouteInfo<void> {
  const FavoriteEmptyRoute({List<PageRouteInfo>? children})
      : super(
          FavoriteEmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteEmptyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FavoritesScreen]
class FavoritesRoute extends PageRouteInfo<void> {
  const FavoritesRoute({List<PageRouteInfo>? children})
      : super(
          FavoritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForgotPasswordScreen]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LibraryEmptyScreen]
class LibraryEmptyRoute extends PageRouteInfo<void> {
  const LibraryEmptyRoute({List<PageRouteInfo>? children})
      : super(
          LibraryEmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'LibraryEmptyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LibraryScreen]
class LibraryRoute extends PageRouteInfo<void> {
  const LibraryRoute({List<PageRouteInfo>? children})
      : super(
          LibraryRoute.name,
          initialChildren: children,
        );

  static const String name = 'LibraryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainBottomNavigationScreen]
class MainBottomNavigationRoute extends PageRouteInfo<void> {
  const MainBottomNavigationRoute({List<PageRouteInfo>? children})
      : super(
          MainBottomNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainBottomNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationsScreen]
class NotificationsRoute extends PageRouteInfo<void> {
  const NotificationsRoute({List<PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlayerScreen]
class PlayerRoute extends PageRouteInfo<PlayerRouteArgs> {
  PlayerRoute({
    Key? key,
    required int initialIndex,
    required List<ClassComposition> classCompositions,
    List<PageRouteInfo>? children,
  }) : super(
          PlayerRoute.name,
          args: PlayerRouteArgs(
            key: key,
            initialIndex: initialIndex,
            classCompositions: classCompositions,
          ),
          initialChildren: children,
        );

  static const String name = 'PlayerRoute';

  static const PageInfo<PlayerRouteArgs> page = PageInfo<PlayerRouteArgs>(name);
}

class PlayerRouteArgs {
  const PlayerRouteArgs({
    this.key,
    required this.initialIndex,
    required this.classCompositions,
  });

  final Key? key;

  final int initialIndex;

  final List<ClassComposition> classCompositions;

  @override
  String toString() {
    return 'PlayerRouteArgs{key: $key, initialIndex: $initialIndex, classCompositions: $classCompositions}';
  }
}

/// generated route for
/// [ProfileEmptyScreen]
class ProfileEmptyRoute extends PageRouteInfo<void> {
  const ProfileEmptyRoute({List<PageRouteInfo>? children})
      : super(
          ProfileEmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileEmptyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<ProfileRouteArgs> page =
      PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [RegistrationScreen]
class RegistrationRoute extends PageRouteInfo<void> {
  const RegistrationRoute({List<PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchEmptyScreen]
class SearchEmptyRoute extends PageRouteInfo<void> {
  const SearchEmptyRoute({List<PageRouteInfo>? children})
      : super(
          SearchEmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchEmptyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInScreen]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SpeechSynthesisBuildScreen]
class SpeechSynthesisBuildRoute
    extends PageRouteInfo<SpeechSynthesisBuildRouteArgs> {
  SpeechSynthesisBuildRoute({
    Key? key,
    String text = GlobalConstant.empty,
    List<PageRouteInfo>? children,
  }) : super(
          SpeechSynthesisBuildRoute.name,
          args: SpeechSynthesisBuildRouteArgs(
            key: key,
            text: text,
          ),
          initialChildren: children,
        );

  static const String name = 'SpeechSynthesisBuildRoute';

  static const PageInfo<SpeechSynthesisBuildRouteArgs> page =
      PageInfo<SpeechSynthesisBuildRouteArgs>(name);
}

class SpeechSynthesisBuildRouteArgs {
  const SpeechSynthesisBuildRouteArgs({
    this.key,
    this.text = GlobalConstant.empty,
  });

  final Key? key;

  final String text;

  @override
  String toString() {
    return 'SpeechSynthesisBuildRouteArgs{key: $key, text: $text}';
  }
}

/// generated route for
/// [SpeechSynthesisResultScreen]
class SpeechSynthesisResultRoute
    extends PageRouteInfo<SpeechSynthesisResultRouteArgs> {
  SpeechSynthesisResultRoute({
    Key? key,
    required String audioPath,
    String text = GlobalConstant.empty,
    List<PageRouteInfo>? children,
  }) : super(
          SpeechSynthesisResultRoute.name,
          args: SpeechSynthesisResultRouteArgs(
            key: key,
            audioPath: audioPath,
            text: text,
          ),
          initialChildren: children,
        );

  static const String name = 'SpeechSynthesisResultRoute';

  static const PageInfo<SpeechSynthesisResultRouteArgs> page =
      PageInfo<SpeechSynthesisResultRouteArgs>(name);
}

class SpeechSynthesisResultRouteArgs {
  const SpeechSynthesisResultRouteArgs({
    this.key,
    required this.audioPath,
    this.text = GlobalConstant.empty,
  });

  final Key? key;

  final String audioPath;

  final String text;

  @override
  String toString() {
    return 'SpeechSynthesisResultRouteArgs{key: $key, audioPath: $audioPath, text: $text}';
  }
}

/// generated route for
/// [SuccessScreen]
class SuccessRoute extends PageRouteInfo<SuccessRouteArgs> {
  SuccessRoute({
    Key? key,
    String? name,
    bool? isNewPassword = false,
    List<PageRouteInfo>? children,
  }) : super(
          SuccessRoute.name,
          args: SuccessRouteArgs(
            key: key,
            name: name,
            isNewPassword: isNewPassword,
          ),
          initialChildren: children,
        );

  static const String name = 'SuccessRoute';

  static const PageInfo<SuccessRouteArgs> page =
      PageInfo<SuccessRouteArgs>(name);
}

class SuccessRouteArgs {
  const SuccessRouteArgs({
    this.key,
    this.name,
    this.isNewPassword = false,
  });

  final Key? key;

  final String? name;

  final bool? isNewPassword;

  @override
  String toString() {
    return 'SuccessRouteArgs{key: $key, name: $name, isNewPassword: $isNewPassword}';
  }
}

/// generated route for
/// [SupportScreen]
class SupportRoute extends PageRouteInfo<void> {
  const SupportRoute({List<PageRouteInfo>? children})
      : super(
          SupportRoute.name,
          initialChildren: children,
        );

  static const String name = 'SupportRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VoiceAssistantScreen]
class VoiceAssistantRoute extends PageRouteInfo<VoiceAssistantRouteArgs> {
  VoiceAssistantRoute({
    Key? key,
    bool isStartSetting = true,
    List<PageRouteInfo>? children,
  }) : super(
          VoiceAssistantRoute.name,
          args: VoiceAssistantRouteArgs(
            key: key,
            isStartSetting: isStartSetting,
          ),
          initialChildren: children,
        );

  static const String name = 'VoiceAssistantRoute';

  static const PageInfo<VoiceAssistantRouteArgs> page =
      PageInfo<VoiceAssistantRouteArgs>(name);
}

class VoiceAssistantRouteArgs {
  const VoiceAssistantRouteArgs({
    this.key,
    this.isStartSetting = true,
  });

  final Key? key;

  final bool isStartSetting;

  @override
  String toString() {
    return 'VoiceAssistantRouteArgs{key: $key, isStartSetting: $isStartSetting}';
  }
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
