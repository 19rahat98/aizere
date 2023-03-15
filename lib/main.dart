import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:speech_synthesis/presentation/onboarding_page/provider/url_provider.dart';
import 'package:speech_synthesis/presentation/splash_page/ui/second_splash_page.dart';

import 'config/theme.dart';
import 'presentation/home_page/provider/synthes_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// status bar icons  light color
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(MyApp(homePage: MyApp()));
}

class MyApp extends StatelessWidget {
  final Widget homePage;

  const MyApp({Key key, this.homePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AiZere',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: AppColors.appMainColor,
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.black,
        ),
        fontFamily: 'Raleway',
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<UrlProvider>(
            create: (_) => UrlProvider(),
          ),
          Provider<SynthesisProvider>(
            create: (_) => SynthesisProvider(),
          ),
        ],
        child: SecondSplashPage(),
      ),
    );
  }
}
