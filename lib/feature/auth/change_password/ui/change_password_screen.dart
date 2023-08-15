import 'package:aizere_app/common/widgets/app_button.dart';
import 'package:aizere_app/common/widgets/app_text_field.dart';
import 'package:aizere_app/common/widgets/app_title_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

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
                title: 'Новый пароль',
                text:
                    'Придумайте новый пароль для входа доступа вашего аккаунта'),
            const SizedBox(height: 40,),
            const AppTextField(
              title: 'Новый пароль',
            ),
            const SizedBox(height: 24,),
            const AppTextField(
              title: 'Повторить новый пароль',
            ),
            const SizedBox(height: 32,),
            const Spacer(),
            AppButton(
              text: 'Восстановить',
              onPressed: () {
                context.router.replace(SuccessRoute(isNewPassword: true));
              },
            ),
            const SizedBox(height: 24,),
            AppButton(
              text: 'Отменить',
              color: Colors.transparent,
              textColor: AppColors.black,
              onPressed: () {
                context.router.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
