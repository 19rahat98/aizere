import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_synthesis/presentation/onboarding_page/provider/url_provider.dart';
import 'package:speech_synthesis/presentation/onboarding_page/ui/onboarding_screen.dart';

import 'config/theme.dart';
import 'di/di_locator.dart' as service_locator;
import 'presentation/home_page/provider/synthes_provider.dart';
import 'presentation/splash_page/ui/splash.dart';
import 'package:speech_synthesis/presentation/home_page/ui/home_page_screen.dart';


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
    return ScreenUtilInit(
      designSize: Size(360, 740),
      builder: () => MaterialApp(
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
          child: OnboardingScreen(),
        ),
      ),
    );
  }
}
