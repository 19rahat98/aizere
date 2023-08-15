import 'package:aizere_app/common/widgets/app_button.dart';
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppTitleWidget(
                title: 'Регистрация',
                text:
                    'Заполните все поля ниже, чтобы пользоваться функциями сервиса'),
            const SizedBox(height: 40,),
            const AppTextField(
              title: 'Имя',
            ),
            const SizedBox(height: 24,),
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
                  'У вас есть аккаунт?',
                  style: AppTextStyle.w600s17,
                ),
                AppTextButton(
                  text: 'Войти',
                  style:
                      AppTextStyle.w600s17.copyWith(color: AppColors.mainBlue),
                  onTap: () {
                    context.router.replace(const SignInRoute());
                  },
                ),
              ],
            ),
            const Spacer(),
            AppButton(
              text: 'Продолжить',
              onPressed: () {
                context.router.push(ConfirmationRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
