import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_text_button.dart';
import 'package:aizere_app/common/widgets/app_text_field.dart';
import 'package:aizere_app/common/widgets/app_title_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 60,
          horizontal: 20,
        ),
        child: Column(
          children: [
            AuthTitleWidget(
              title: context.l10n.auth,
              text: context.l10n.fillAllFieldsAuth,
            ),
            const SizedBox(
              height: 40,
            ),
            AuthTextField(
              title: context.l10n.phone,
            ),
            const SizedBox(
              height: 24,
            ),
            AuthTextField(
              title: context.l10n.password,
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  context.l10n.dontHaveAnAccount,
                  style: AppTextStyle.w600s17,
                ),
                AppTextButton(
                  onTap: () {
                    context.router.replace(
                      const RegistrationRoute(),
                    );
                  },
                  text: context.l10n.signUp,
                  style: AppTextStyle.w600s17.copyWith(
                    color: AppColors.mainBlue,
                  ),
                ),
              ],
            ),
            const Spacer(),
            AppFilledColorButton(
              onTap: () {
                context.router.replace(
                  SpeechSynthesisBuildRoute(),
                );
              },
              text: context.l10n.enter,
              padding: const EdgeInsets.symmetric(vertical: 16),
              color: AppColors.mainBlue,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                context.router.push(const ForgotPasswordRoute());
              },
              child: Text(
                context.l10n.forgotPassword,
                style: AppTextStyle.w600s17.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
