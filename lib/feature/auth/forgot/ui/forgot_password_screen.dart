import 'package:aizere_app/common/widgets/app_button.dart';
import 'package:aizere_app/common/widgets/app_text_field.dart';
import 'package:aizere_app/common/widgets/app_title_widget.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(
          children: [
            const AppTitleWidget(
                title: 'Забыли пароль?',
                text:
                    'Заполните все поля ниже, чтобы восстановить доступ к аккаунту.'),
            const SizedBox(height: 40,),
            const AppTextField(
              title: 'Номер телефона',
            ),
            const Spacer(),
            AppButton(
              onPressed: () {
                context.router.replace(ConfirmationRoute(isForgotPass: true));
              },
              text: 'Отправить код',

            ),
          ],
        ),
      ),
    );
  }
}
