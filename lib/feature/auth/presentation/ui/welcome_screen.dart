import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_title_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'widgets/welcome_icons.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            HBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            const Center(child: WelcomeIcons()),
            const SizedBox(
              height: 30,
            ),
            AuthTitleWidget(
              title: context.l10n.welcome,
              text: context.l10n.welcomeDescription,
            ),
            const Spacer(),
            AppFilledColorButton(
              onTap: () {
                context.router.push(const RegistrationRoute());
              },
              color: AppColors.mainBlue,
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              text: context.l10n.signUp,
            ),
            const SizedBox(
              height: 20,
            ),
            AppFilledColorButton(
              onTap: () {
                context.router.replace(const SignInRoute());
              },
              text: context.l10n.enter,
              color: AppColors.grayBlue,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ],
        ),
      ),
    );
  }
}
