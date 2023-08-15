import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_title_widget.dart';
import 'package:aizere_app/config/theme.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(
          children: [
            const Center(child: WelcomeIcons()),
            const SizedBox(
              height: 30,
            ),
            const AppTitleWidget(
              title: 'Добро пожаловать в AIzere!',
              text:
                  'Более миллионов человек уже используют AIzere, чтобы общаться с искусственным интелектом',
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
              text: 'Регистрация',
            ),
            const SizedBox(
              height: 20,
            ),
            AppFilledColorButton(
              onTap: () {
                context.router.replace(const SignInRoute());
              },
              text: 'Вход',
              color: AppColors.ffABB0BC,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ],
        ),
      ),
    );
  }
}
