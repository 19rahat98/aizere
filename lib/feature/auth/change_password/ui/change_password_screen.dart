import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_text_field.dart';
import 'package:aizere_app/common/widgets/app_title_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
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
            const SizedBox(
              height: 40,
            ),
            const AppTextField(
              title: 'Новый пароль',
            ),
            const SizedBox(
              height: 24,
            ),
            const AppTextField(
              title: 'Повторить новый пароль',
            ),
            const SizedBox(
              height: 32,
            ),
            const Spacer(),
            AppFilledColorButton(
              onTap: () {
                context.router.replace(SuccessRoute(isNewPassword: true));
              },
              text: 'Восстановить',
              padding: const EdgeInsets.symmetric(vertical: 16),
              color: AppColors.mainBlue,
            ),
            const SizedBox(
              height: 24,
            ),
            TextButton(
              onPressed: () {
                context.router.pop();
              },
              child: Text(
                'Отменить',
                style: AppTextStyle.w600s17.copyWith(color: AppColors.black),

              ),
            )

            // AppFilledColorButton(
            //   onTap: (){
            //     context.router.pop();
            //
            //   },
            //   text: 'Отменить',
            //   padding: const EdgeInsets.symmetric(vertical: 16),
            //   color: Colors.transparent,
            //   textColor: AppColors.black,
            // ),

          ],
        ),
      ),
    );
  }
}
