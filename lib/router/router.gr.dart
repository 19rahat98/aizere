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
    ConfirmationRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmationRouteArgs>(
          orElse: () => const ConfirmationRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ConfirmationScreen(
          key: args.key,
          isForgotPass: args.isForgotPass,
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
    HelloRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HelloScreen(),
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
    NewPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewPasswordScreen(),
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
    SuccessRoute.name: (routeData) {
      final args = routeData.argsAs<SuccessRouteArgs>(
          orElse: () => const SuccessRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SuccessScreen(
          key: args.key,
          isNewPassword: args.isNewPassword,
        ),
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
/// [ConfirmationScreen]
class ConfirmationRoute extends PageRouteInfo<ConfirmationRouteArgs> {
  ConfirmationRoute({
    Key? key,
    bool? isForgotPass = false,
    List<PageRouteInfo>? children,
  }) : super(
          ConfirmationRoute.name,
          args: ConfirmationRouteArgs(
            key: key,
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
    this.isForgotPass = false,
  });

  final Key? key;

  final bool? isForgotPass;

  @override
  String toString() {
    return 'ConfirmationRouteArgs{key: $key, isForgotPass: $isForgotPass}';
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
/// [HelloScreen]
class HelloRoute extends PageRouteInfo<void> {
  const HelloRoute({List<PageRouteInfo>? children})
      : super(
          HelloRoute.name,
          initialChildren: children,
        );

  static const String name = 'HelloRoute';

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
/// [NewPasswordScreen]
class NewPasswordRoute extends PageRouteInfo<void> {
  const NewPasswordRoute({List<PageRouteInfo>? children})
      : super(
          NewPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewPasswordRoute';

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
/// [SuccessScreen]
class SuccessRoute extends PageRouteInfo<SuccessRouteArgs> {
  SuccessRoute({
    Key? key,
    bool? isNewPassword = false,
    List<PageRouteInfo>? children,
  }) : super(
          SuccessRoute.name,
          args: SuccessRouteArgs(
            key: key,
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
    this.isNewPassword = false,
  });

  final Key? key;

  final bool? isNewPassword;

  @override
  String toString() {
    return 'SuccessRouteArgs{key: $key, isNewPassword: $isNewPassword}';
  }
}
