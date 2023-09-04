import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_title_widget.dart';
import 'package:aizere_app/common/widgets/screen_wrapper.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/widgets/app_hbox_widget.dart';

@RoutePage()
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    this.name,
    this.isNewPassword = false,
  });

  final bool? isNewPassword;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      body: Column(
        children: [
          HBox(
            height: MediaQuery.of(context).size.height / 6,
          ),
          SvgPicture.asset(AppIcons.icSuccess),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AuthTitleWidget(
              title: '${context.l10n.congratulations}, $name!',
              text: isNewPassword!
                  ? context.l10n.forgotSuccessDescription
                  : context.l10n.signUpSuccessDescription,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: AppFilledColorButton(
              onTap: () => context.router.replace(
                SpeechSynthesisBuildRoute(),
              ),
              color: AppColors.mainBlue,
              text: context.l10n.finalize,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ],
      ),
    );
  }
}
