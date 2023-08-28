import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_text_field.dart';
import 'package:aizere_app/common/widgets/app_title_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/l10n/l10n.dart';
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
            AuthTitleWidget(
                title: context.l10n.forgotPassword,
                text: context.l10n.fillAllFieldsForget),
            const SizedBox(
              height: 40,
            ),
            AuthTextField(
              title: context.l10n.mail,
              hintText: context.l10n.enterMail,
            ),
            const Spacer(),
            AppFilledColorButton(
              onTap: () {
                context.router.replace(ConfirmationRoute(isForgotPass: true));
              },
              text: context.l10n.confirmationCode,
              padding: const EdgeInsets.symmetric(vertical: 16),
              color: AppColors.mainBlue,
            )
          ],
        ),
      ),
    );
  }
}
