import 'package:aizere_app/common/widgets/app_text_button.dart';
import 'package:aizere_app/common/widgets/app_text_field.dart';
import 'package:aizere_app/common/widgets/app_title_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/app_button.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(
          children: [
            const AppTitleWidget(
                title: 'Авторизация',
                text: 'Заполните все поля ниже, чтобы войти в систему сервиса'),
            const SizedBox(height: 40,),
            const AppTextField(
              title: 'Номер телефона',
            ),
            const SizedBox(height: 24,),
            const AppTextField(
              title: 'Пароль',
            ),
            const SizedBox(height: 32,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'У вас нет аккаунта? ',
                  style: AppTextStyle.w600s17,
                ),
                AppTextButton(
                  onTap: () {
                    context.router.replace(const RegistrationRoute());
                  },
                  text: 'Регистрация',
                  style:
                      AppTextStyle.w600s17.copyWith(color: AppColors.mainBlue),

                ),
              ],
            ),
            const Spacer(),
            AppButton(
              onPressed: () {
                context.router.replace(SpeechSynthesisBuildRoute());
              },
              text: 'Войти',

            ),
            const SizedBox(height: 20,),
            AppButton(
              onPressed: () {
                context.router.push(const ForgotPasswordRoute());
              },
              text: 'Забыли пароль?',
              color: Colors.transparent,
              textColor: AppColors.black,

            ),
          ],
        ),
      ),
    );
  }
}
