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
    ChangePasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChangePasswordScreen(),
      );
    },
    ConfirmationRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmationRouteArgs>(
          orElse: () => const ConfirmationRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ConfirmationScreen(
          key: args.key,
          isForgotPass: args.isForgotPass,
          username: args.username,
          name: args.name,
        ),
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
          text: args.text,
          cubit: args.cubit,
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
          isNewPassword: args.isNewPassword,
          name: args.name,
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
/// [ConfirmationScreen]
class ConfirmationRoute extends PageRouteInfo<ConfirmationRouteArgs> {
  ConfirmationRoute({
    Key? key,
    bool? isForgotPass = false,
    String? username,
    String? name,
    List<PageRouteInfo>? children,
  }) : super(
          ConfirmationRoute.name,
          args: ConfirmationRouteArgs(
            key: key,
            isForgotPass: isForgotPass,
            username: username,
            name: name,
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
    this.isForgotPass = false,
    this.username,
    this.name,
  });

  final Key? key;

  final bool? isForgotPass;

  final String? username;

  final String? name;

  @override
  String toString() {
    return 'ConfirmationRouteArgs{key: $key, isForgotPass: $isForgotPass, username: $username, name: $name}';
  }
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
    String text = GlobalConstant.empty,
    required SpeechCubit cubit,
    List<PageRouteInfo>? children,
  }) : super(
          SpeechSynthesisResultRoute.name,
          args: SpeechSynthesisResultRouteArgs(
            key: key,
            text: text,
            cubit: cubit,
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
    this.text = GlobalConstant.empty,
    required this.cubit,
  });

  final Key? key;

  final String text;

  final SpeechCubit cubit;

  @override
  String toString() {
    return 'SpeechSynthesisResultRouteArgs{key: $key, text: $text, cubit: $cubit}';
  }
}

/// generated route for
/// [SuccessScreen]
class SuccessRoute extends PageRouteInfo<SuccessRouteArgs> {
  SuccessRoute({
    Key? key,
    bool? isNewPassword = false,
    String? name,
    List<PageRouteInfo>? children,
  }) : super(
          SuccessRoute.name,
          args: SuccessRouteArgs(
            key: key,
            isNewPassword: isNewPassword,
            name: name,
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
    this.isNewPassword = false,
    this.name,
  });

  final Key? key;

  final bool? isNewPassword;

  final String? name;

  @override
  String toString() {
    return 'SuccessRouteArgs{key: $key, isNewPassword: $isNewPassword, name: $name}';
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
