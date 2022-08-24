import 'package:flutter/material.dart';
import 'package:speech_synthesis/presentation/splash_page/ui/first_spash_page.dart';
import 'package:speech_synthesis/presentation/splash_page/ui/second_splash_page.dart';
import 'package:speech_synthesis/presentation/splash_page/ui/third_splash_page.dart';

class SplashScreen extends StatefulWidget {
  final String requestUrl;

  const SplashScreen({Key key, @required this.requestUrl}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentPage = 0;
  List<Widget> splashPages;

  @override
  void initState() {
    splashPages = [
      FistSplashPage(),
      SecondSplashPage(),
      ThirdSplashPage(
        requestUrl: widget.requestUrl,
      )
    ];
    super.initState();
  }

  final PageController _pageController = PageController(initialPage: 0);

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: w,
        height: h,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          //physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: _onPageChanged,
          itemCount: splashPages.length,
          itemBuilder: (ctx, i) => splashPages[i],
        ),
      ),
    );
  }
}
