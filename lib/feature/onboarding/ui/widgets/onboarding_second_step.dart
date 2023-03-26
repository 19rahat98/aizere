import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_text_button.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingSecondStep extends StatelessWidget {
  const OnboardingSecondStep({
    Key? key,
    required this.onPressSkipButton,
  }) : super(key: key);

  final Function() onPressSkipButton;

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
                    onTap: onPressSkipButton,
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
                  context.l10n.stepTwo,
                  style: AppTextStyle.title1,
                ),
                const HBox(
                  height: 24,
                ),
                Text(
                  context.l10n.copyText,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.title.copyWith(
                    color: Colors.white,
                  ),
                ),
                const HBox(
                  height: 28,
                ),
                Text(
                  context.l10n.minimumButtonFriendlyUx,
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
            bottom: MediaQuery.of(context).size.height / 6,
            child: Transform.rotate(
              angle: 6.4,
              child: Container(
                width: 320,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Абай қазақтың әдебиетінде қайталанбас ұлы ойшы, философ, ақын. Абай өз балалық кезін әжесі мен анасының жанында өткізген.',
                  style: AppTextStyle.body,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
