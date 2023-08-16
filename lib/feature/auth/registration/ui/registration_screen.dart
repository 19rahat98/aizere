import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_text_button.dart';
import 'package:aizere_app/common/widgets/app_text_field.dart';
import 'package:aizere_app/common/widgets/app_title_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(
          children: [
            const AuthTitleWidget(
                title: 'Регистрация',
                text:
                    'Заполните все поля ниже, чтобы пользоваться функциями сервиса'),
            const SizedBox(
              height: 40,
            ),
            const AuthTextField(
              title: 'Имя',
            ),
            const SizedBox(
              height: 24,
            ),
            const AuthTextField(
              title: 'Номер телефона',
            ),
            const SizedBox(
              height: 24,
            ),
            const AuthTextField(
              title: 'Пароль',
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'У вас есть аккаунт?',
                  style: AppTextStyle.w600s17,
                ),
                AppTextButton(
                  onTap: () {
                    context.router.replace(const SignInRoute());
                  },
                  text: 'Войти',
                  style:
                      AppTextStyle.w600s17.copyWith(color: AppColors.mainBlue),
                ),
              ],
            ),
            const Spacer(),
            AppFilledColorButton(
              onTap: () {
                context.router.push(ConfirmationRoute());
              },
              text: 'Продолжить',
              padding: const EdgeInsets.symmetric(vertical: 16),
              color: AppColors.mainBlue,
            ),

          ],
        ),
      ),
    );
  }
}
