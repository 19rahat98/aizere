import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_synthesis/presentation/onboarding_page/provider/url_provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => context.read<UrlProvider>().initProvider(context));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Consumer<UrlProvider>(
        builder: (context,repo, _)  {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
    );
  }
}
