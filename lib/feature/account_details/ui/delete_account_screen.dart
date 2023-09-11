import 'package:aizere_app/common/widgets/app_custom_app_bar.dart';
import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppCustomAppBar(
        title: 'Удалить мой аккаунт',
        isSettings: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Image.asset(AppImages.delete),
            ),
            Text(
              'Вы точно хотите удалить из аккаунта?\nВесь последующий прогресс будет\nудален.',
              style: AppTextStyle.body.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            Column(
              children: [
                AppFilledColorButton(
                  onTap: () => context.router.pop(),
                  text: 'Вернуться назад',
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  color: AppColors.mainBlue,
                ),
                const SizedBox(
                  height: 12,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Удалить мой аккаунт',
                    style: AppTextStyle.body,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
