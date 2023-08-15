import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/feature/auth/confirmation/presentation/ui/confirmation_screen.dart';
import 'package:aizere_app/feature/auth/forgot/ui/forgot_password_screen.dart';
import 'package:aizere_app/feature/auth/new_password/ui/new_password_screen.dart';
import 'package:aizere_app/feature/auth/registration/ui/registration_screen.dart';
import 'package:aizere_app/feature/auth/sign_in/ui/sign_in_screen.dart';
import 'package:aizere_app/feature/auth/success_registration/ui/success_screen.dart';
import 'package:aizere_app/feature/auth/welcome/ui/welcome_screen.dart';
import 'package:aizere_app/feature/bottom_navigation/presentation/ui/main_bottom_navigation_widget.dart';
import 'package:aizere_app/feature/favorites/presentation/ui/favorites_screen.dart';
import 'package:aizere_app/feature/library/presentation/ui/library_screen.dart';
import 'package:aizere_app/feature/search/presentation/ui/search_screen.dart';
import 'package:aizere_app/feature/speech_synthesis/presentation/ui/speech_synthesis_screen.dart';
import 'package:aizere_app/router/empty/empty_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';

part 'router.gr.dart';

// flutter packages pub run build_runner build --delete-conflicting-outputs

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/auth', page: WelcomeRoute.page, initial: true),
        AutoRoute(page: RegistrationRoute.page),
        AutoRoute(page: ConfirmationRoute.page),
        AutoRoute(page: SuccessRoute.page),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: NewPasswordRoute.page),

        AutoRoute(
          page: MainBottomNavigationRoute.page,
          // initial: true,
          children: [
            AutoRoute(page: AizereEmptyRoute.page, children: [
              AutoRoute(path: 'aizere', page: SpeechSynthesisBuildRoute.page),
            ]),
            AutoRoute(page: SearchEmptyRoute.page, children: [
              AutoRoute(path: 'search', page: SearchRoute.page),
            ]),
            AutoRoute(page: FavoriteEmptyRoute.page, children: [
              AutoRoute(path: 'favorite', page: FavoritesRoute.page)
            ]),
            AutoRoute(page: LibraryEmptyRoute.page, children: [
              AutoRoute(path: 'library', page: LibraryRoute.page),
            ]),
          ],
        )
      ];
}
