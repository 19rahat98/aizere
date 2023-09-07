import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/feature/auth/presentation/ui/change_password_screen.dart';
import 'package:aizere_app/feature/auth/presentation/ui/confirmation_screen.dart';
import 'package:aizere_app/feature/auth/presentation/ui/forgot_password_screen.dart';
import 'package:aizere_app/feature/auth/presentation/ui/registration_screen.dart';
import 'package:aizere_app/feature/auth/presentation/ui/sign_in_screen.dart';
import 'package:aizere_app/feature/auth/presentation/ui/success_screen.dart';
import 'package:aizere_app/feature/auth/presentation/ui/welcome_screen.dart';
import 'package:aizere_app/feature/bottom_navigation/presentation/ui/main_bottom_navigation_widget.dart';
import 'package:aizere_app/feature/favorites/presentation/ui/favorites_screen.dart';
import 'package:aizere_app/feature/library/presentation/ui/library_screen.dart';
import 'package:aizere_app/feature/onboarding/ui/onboarding_screen.dart';
import 'package:aizere_app/feature/search/presentation/ui/search_screen.dart';
import 'package:aizere_app/feature/speech_synthesis/presentation/cubit/speech_download/speech_cubit.dart';
import 'package:aizere_app/feature/speech_synthesis/presentation/ui/speech_synthesis_result_screen.dart';
import 'package:aizere_app/feature/settings/choose_interface/ui/choose_interface_screen.dart';
import 'package:aizere_app/feature/settings/choose_local/presentation/ui/choose_locale_screen.dart';
import 'package:aizere_app/feature/settings/voice_assistant/presentation/ui/voice_assistant.dart';
import 'package:aizere_app/feature/speech_synthesis/presentation/ui/speech_synthesis_screen.dart';
import 'package:aizere_app/feature/splash/ui/splash_screen.dart';
import 'package:aizere_app/router/empty/empty_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';

part 'router.gr.dart';

// flutter packages pub run build_runner build --delete-conflicting-outputs

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AppSplashRoute.page, initial: true),
        AutoRoute(path: '/auth', page: WelcomeRoute.page),
        AutoRoute(page: RegistrationRoute.page),
        AutoRoute(page: ConfirmationRoute.page),
        AutoRoute(page: SuccessRoute.page),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: ChangePasswordRoute.page),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: ChooseLocaleRoute.page),
        AutoRoute(page: VoiceAssistantRoute.page),
        AutoRoute(page: ChooseInterfaceRoute.page),
        AutoRoute(
          page: MainBottomNavigationRoute.page,
          children: [
            AutoRoute(page: AizereEmptyRoute.page, children: [
              AutoRoute(path: 'aizere', page: SpeechSynthesisBuildRoute.page),
              AutoRoute(page: SpeechSynthesisResultRoute.page),
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
        ),
      ];
}
