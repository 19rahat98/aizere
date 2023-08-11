import 'package:aizere_app/common/constants/global_file_extension_constant.dart';
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppTitleWidget(
                title: 'Авторизация',
                text: 'Заполните все поля ниже, чтобы войти в систему сервиса'),
            40.h,
            const AppTextField(
              title: 'Номер телефона',
            ),
            24.h,
            const AppTextField(
              title: 'Пароль',
            ),
            32.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'У вас нет аккаунта? ',
                  style: AppTextStyle.w600s17,
                ),
                AppTextButton(
                  text: 'Регистрация',
                  style:
                      AppTextStyle.w600s17.copyWith(color: AppColors.mainBlue),
                  onTap: () {
                    context.router.replace(const RegistrationRoute());
                  },
                ),
              ],
            ),
            const Spacer(),
            AppButton(
              text: 'Войти',
              onPressed: () {
                context.router.replace(SpeechSynthesisBuildRoute());
              },
            ),
            20.h,
            AppButton(
              text: 'Забыли пароль?',
              color: Colors.transparent,
              textColor: AppColors.black,
              onPressed: () {
                context.router.push(const ForgotPasswordRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
