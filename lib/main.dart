import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/bottom_navigation/presentation/cubit/global_navigation_cubit.dart';
import 'package:aizere_app/feature/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:aizere_app/feature/language_logic/presentation/cubit/local_language_cubit.dart';
import 'package:aizere_app/feature/launch_app/presentation/launch_app_page.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:aizere_app/di/di_locator.dart' as di_locator;
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_persistent_keyboard_height/flutter_persistent_keyboard_height.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// установка ориентации
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// инициализация DI
  di_locator.initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocalLanguageCubit>(
          create: (context) => LocalLanguageCubit()..getLanguageCode(),
        ),
        BlocProvider<GlobalNavigationCubit>(
          create: (context) => GlobalNavigationCubit(),
        ),
        BlocProvider<FavoritesCubit>(
          lazy: false,
          create: (context) => FavoritesCubit()..loadFavorites(),
        ),
      ],
      child: BlocBuilder<LocalLanguageCubit, LocalLanguageState>(
        builder: (context, localLanguageState) {
          if (localLanguageState is LanguageLoaded) {
            return MaterialApp(
              useInheritedMediaQuery: false,
              title: GlobalConstant.appName,
              theme: AppTheme.defaultTheme,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: localLanguageState.locale,
              supportedLocales: AppLocalizations.supportedLocales,
              home: const LaunchAppPage(),
              // персистент нав бардан кин MediaQuery.of(context).viewInsets.bottom стеми калад, выглядит иронично но решение тоже персистент фигня хахаха
              builder: (context, child) => PersistentKeyboardHeightProvider(
                child: child!,
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
