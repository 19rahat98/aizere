import 'dart:math';

import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_text_button.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/settings/choose_local/presentation/ui/choose_locale_screen.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingFirstStep extends StatelessWidget {
  const OnboardingFirstStep({
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
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ChooseLocale(),
                        ),
                      );
                    },
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
                  context.l10n.stepOne,
                  style: AppTextStyle.title1,
                ),
                const HBox(
                  height: 24,
                ),
                Text(
                  context.l10n.selectDesiredText,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.title.copyWith(
                    color: Colors.white,
                  ),
                ),
                const HBox(
                  height: 28,
                ),
                Text(
                  context.l10n.aizereSynthesisThousandText,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.body.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: -40,
            bottom: 100,
            child: Transform.rotate(
              angle: -pi / 14,
              child: Container(
                width: 320,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      AppIcons.icSoundLine,
                    ),
                    const HBox(),
                    SvgPicture.asset(
                      AppIcons.icPlayFilled,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
