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
class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(
          children: [
            AuthTitleWidget(
                title: context.l10n.signUp,
                text: context.l10n.fillAllFieldsSignUp),
            const SizedBox(
              height: 40,
            ),
            AuthTextField(
              title: context.l10n.name,
            ),
            const SizedBox(
              height: 24,
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
                  context.l10n.haveAnAccount,
                  style: AppTextStyle.w600s17,
                ),
                AppTextButton(
                  onTap: () {
                    context.router.replace(const SignInRoute());
                  },
                  text: context.l10n.enter,
                  style:
                      AppTextStyle.w600s17.copyWith(color: AppColors.mainBlue),
                ),
              ],
            ),
            const Spacer(),
            AppFilledColorButton(
              onTap: () {
                context.router.push(ConfirmationRoute());
              },
              text: context.l10n.continueText,
              padding: const EdgeInsets.symmetric(vertical: 16),
              color: AppColors.mainBlue,
            ),
          ],
        ),
      ),
    );
  }
}
