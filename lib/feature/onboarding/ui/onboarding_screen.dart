import 'package:aizere_app/common/widgets/app_stepper.dart';
import 'package:aizere_app/common/widgets/app_text_button.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/onboarding/ui/widgets/onboarding_last_step.dart';
import 'package:aizere_app/feature/onboarding/ui/widgets/onboarding_second_step.dart';
import 'package:aizere_app/feature/onboarding/ui/widgets/onboarding_third_step.dart';
import 'package:aizere_app/feature/onboarding/ui/widgets/ondoaring_first_step.dart';
import 'package:aizere_app/feature/settings/choose_local/presentation/ui/choose_locale_screen.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  late PageController pageController;
  late List<Widget> pageList;

  @override
  void initState() {
    pageController = PageController();
    pageList = [
      OnboardingFirstStep(
        onPressSkipButton: () {
          pageController.animateToPage(
            1,
            curve: Curves.ease,
            duration: const Duration(milliseconds: 1000),
          );
        },
      ),
      OnboardingSecondStep(
        onPressSkipButton: () {
          pageController.animateToPage(
            2,
            curve: Curves.ease,
            duration: const Duration(milliseconds: 1000),
          );
        },
      ),
      OnboardingThirdStep(
        onPressSkipButton: () {
          pageController.animateToPage(
            3,
            curve: Curves.ease,
            duration: const Duration(milliseconds: 1000),
          );
        },
      ),
      const OnboardingLastStep(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.mainBlue,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: AppColors.mainBlue,
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  onPageChanged: (value) {
                    currentPage = value;
                    setState(() {});
                  },
                  controller: pageController,
                  children: pageList,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 32,
                ),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppStepper(
                      length: pageList.length,
                      currentIndex: currentPage,
                    ),
                    getFloatButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getFloatButton() {
    if (currentPage + 1 != pageList.length) {
      return AppTextButton(
        onTap: () {
          pageController.animateToPage(
            currentPage + 1,
            curve: Curves.ease,
            duration: const Duration(milliseconds: 1000),
          );
        },
        text: context.l10n.next,
      );
    }
    return AppTextButton(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const ChooseLocale(),
          ),
        );
      },
      text: context.l10n.start,
    );
  }
}
