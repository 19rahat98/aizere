import 'package:aizere_app/common/widgets/app_common_divider_widget.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_text_button.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/settings/choose_local/presentation/ui/choose_locale_screen.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingLastStep extends StatelessWidget {
  const OnboardingLastStep({
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
                    text: context.l10n.skip,
                    isCenter: false,
                    style: AppTextStyle.textButtonStyle.copyWith(
                      color: AppColors.mainBlue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const HBox(
                  height: 54,
                ),
                Text(
                  context.l10n.library,
                  style: AppTextStyle.title.copyWith(
                    color: Colors.white,
                  ),
                ),
                const HBox(
                  height: 28,
                ),
                Text(
                  context.l10n.librarySectionAndListenBooks,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.body.copyWith(
                    color: Colors.white,
                  ),
                ),
                const Expanded(
                  child: HBox(),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 6,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Егіннің бастары',
                          style: AppTextStyle.body.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: const Text(
                          'Ахмет Байтұрсынұлы',
                          style: AppTextStyle.regular,
                        ),
                        leading: Container(
                          width: 48,
                          height: 48,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.monoGrey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: SvgPicture.asset(
                            AppIcons.icBook,
                          ),
                        ),
                        trailing: SvgPicture.asset(
                          AppIcons.icPlayFilled,
                          color: AppColors.mainBlue,
                          width: 32,
                          height: 32,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 16,
                        ),
                        dense: false,
                      ),
                      const AppCommonDividerWidget(),
                      ListTile(
                        title: Text(
                          'Адамдық диқаншысы',
                          style: AppTextStyle.body.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: const Text(
                          'Ахмет Байтұрсынұлы',
                          style: AppTextStyle.regular,
                        ),
                        leading: Container(
                          width: 48,
                          height: 48,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.monoGrey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: SvgPicture.asset(
                            AppIcons.icBook,
                          ),
                        ),
                        trailing: SvgPicture.asset(
                          AppIcons.icPlayFilled,
                          color: AppColors.mainBlue,
                          width: 32,
                          height: 32,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 16,
                        ),
                        dense: false,
                      ),
                    ],
                  ),
                ),
                const HBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
