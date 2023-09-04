import 'dart:math';

import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_text_button.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/settings/choose_local/presentation/ui/choose_locale_screen.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingThirdStep extends StatelessWidget {
  const OnboardingThirdStep({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.mainBlue,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            right: 0,
            top: MediaQuery.of(context).size.height / 2,
            child: SvgPicture.asset(
              AppIcons.icEllipse,
              width: 250,
            ),
          ),
          Positioned(
            left: 40,
            bottom: MediaQuery.of(context).size.height / 2.4,
            child: SvgPicture.asset(
              AppIcons.icSmallEllipse,
              width: 120,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 24,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: AppTextButton(
                    onTap: () => context.router.replace(
                      const WelcomeRoute(),
                    ),
                    isCenter: false,
                    text: context.l10n.skip,
                    style: AppTextStyle.textButtonStyle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const HBox(
                  height: 54,
                ),
                Text(
                  context.l10n.stepThree,
                  style: AppTextStyle.title1,
                ),
                const HBox(
                  height: 24,
                ),
                Text(
                  context.l10n.clickPlay,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.title.copyWith(
                    color: Colors.white,
                  ),
                ),
                const HBox(
                  height: 28,
                ),
                Text(
                  context.l10n.useVirtualSpeakers,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.body.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -40,
            bottom: 100,
            child: Transform.rotate(
              angle: 6.4,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.monoGrey,
                  borderRadius: BorderRadius.circular(12),
                ),
                width: 150,
                height: 200,
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  AppImages.icIseke,
                ),
              ),
            ),
          ),
          Positioned(
            left: -40,
            bottom: MediaQuery.of(context).size.height / 4,
            child: Transform.rotate(
              angle: -pi / 14,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.monoGrey,
                  borderRadius: BorderRadius.circular(12),
                ),
                width: 150,
                height: 200,
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  AppImages.icRaya,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
