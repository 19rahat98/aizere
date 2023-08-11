import 'package:aizere_app/common/constants/global_file_extension_constant.dart';
import 'package:aizere_app/common/widgets/app_button.dart';
import 'package:aizere_app/common/widgets/app_text_field.dart';
import 'package:aizere_app/common/widgets/app_title_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

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
            40.h,
            const AppTextField(
              title: 'Новый пароль',
            ),
            24.h,
            const AppTextField(
              title: 'Повторить новый пароль',
            ),
            32.h,
            const Spacer(),
            AppButton(
              text: 'Восстановить',
              onPressed: () {
                context.router.replace(SuccessRoute(isNewPassword: true));
              },
            ),
            20.h,
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
