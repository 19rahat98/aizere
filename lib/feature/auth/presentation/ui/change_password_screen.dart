import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_text_field.dart';
import 'package:aizere_app/common/widgets/app_title_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/l10n/l10n.dart';
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
          children: [
            AuthTitleWidget(
                title: context.l10n.newPassword,
                text:
                    context.l10n.newPasswordDescription),
            const SizedBox(
              height: 40,
            ),
            AuthTextField(
              title: context.l10n.newPassword,
            ),
            const SizedBox(
              height: 24,
            ),
            AuthTextField(
              title: context.l10n.repeatNewPassword,
            ),
            const SizedBox(
              height: 32,
            ),
            const Spacer(),
            AppFilledColorButton(
              onTap: () {
                context.router.replace(SuccessRoute(isNewPassword: true));
              },
              text: context.l10n.restore,
              padding: const EdgeInsets.symmetric(vertical: 16),
              color: AppColors.mainBlue,
            ),
            const SizedBox(
              height: 24,
            ),
            TextButton(
              onPressed: () => context.router.pop(),
              child: Text(
                context.l10n.cancel,
                style: AppTextStyle.w600s17.copyWith(color: AppColors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}