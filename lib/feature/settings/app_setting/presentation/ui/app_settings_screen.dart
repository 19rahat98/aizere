import 'package:aizere_app/common/widgets/app_common_divider_widget.dart';
import 'package:aizere_app/common/widgets/screen_wrapper.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/auth/presentation/cubit/auth/sign_up/sign_up_cubit.dart';
import 'package:aizere_app/feature/settings/choose_local/presentation/ui/choose_locale_screen.dart';
import 'package:aizere_app/feature/settings/select_speaker/presentation/ui/choose_speaker.dart';
import 'package:aizere_app/feature/settings/voice_assistant/presentation/ui/voice_assistant.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSettingScreen extends StatelessWidget {
  const AppSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      bottom: false,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          splashRadius: 20,
          constraints: const BoxConstraints(),
          icon: SvgPicture.asset(
            AppIcons.icArrowLeft,
          ),
        ),
        title: Text(
          context.l10n.setting,
          style: AppTextStyle.title.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: AppColors.black,
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Expanded(
                    child: ColoredBox(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Material(
                            type: MaterialType.transparency,
                            child: ListTile(
                              onTap: () {},
                              title: Text(
                                context.l10n.specialFeature,
                                style: AppTextStyle.regular.copyWith(
                                  color: AppColors.black,
                                ),
                              ),
                              leading: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: AppColors.monoGrey,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    'Aa',
                                    style: AppTextStyle.regular.copyWith(
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ),
                              trailing: SvgPicture.asset(
                                AppIcons.icArrowRight,
                                color: AppColors.black,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 16,
                              ),
                              dense: false,
                            ),
                          ),
                          const AppCommonDividerWidget(),
                          Material(
                            type: MaterialType.transparency,
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const ChooseLocale(
                                      isStartSetting: false,
                                    ),
                                  ),
                                );
                              },
                              title: Text(
                                context.l10n.language,
                                style: AppTextStyle.regular.copyWith(
                                  color: AppColors.black,
                                ),
                              ),
                              leading: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: AppColors.monoGrey,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    AppIcons.icGlobal,
                                  ),
                                ),
                              ),
                              trailing: SvgPicture.asset(
                                AppIcons.icArrowRight,
                                color: AppColors.black,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 16,
                              ),
                              dense: false,
                            ),
                          ),
                          const AppCommonDividerWidget(),
                          Material(
                            type: MaterialType.transparency,
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const ChooseSpeaker(
                                      isStartSetting: false,
                                    ),
                                  ),
                                );
                              },
                              title: Text(
                                context.l10n.speakers,
                                style: AppTextStyle.regular.copyWith(
                                  color: AppColors.black,
                                ),
                              ),
                              leading: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: AppColors.monoGrey,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    AppIcons.icVolumeHigh,
                                  ),
                                ),
                              ),
                              trailing: SvgPicture.asset(
                                AppIcons.icArrowRight,
                                color: AppColors.black,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 16,
                              ),
                              dense: false,
                            ),
                          ),
                          const AppCommonDividerWidget(),
                          Material(
                            type: MaterialType.transparency,
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const VoiceAssistant(
                                      isStartSetting: false,
                                    ),
                                  ),
                                );
                              },
                              title: Text(
                                context.l10n.voiceAssistant,
                                style: AppTextStyle.regular.copyWith(
                                  color: AppColors.black,
                                ),
                              ),
                              leading: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: AppColors.monoGrey,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    AppIcons.icVoiceCircle,
                                  ),
                                ),
                              ),
                              trailing: SvgPicture.asset(
                                AppIcons.icArrowRight,
                                color: AppColors.black,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 16,
                              ),
                              dense: false,
                            ),
                          ),
                          const AppCommonDividerWidget(),
                          Material(
                            type: MaterialType.transparency,
                            child: ListTile(
                              onTap: () {
                                context.read<SignUpCubit>().logOut();
                                context.router.replace(
                                  const AppSplashRoute(),
                                );
                              },
                              title: Text(
                                context.l10n.logout,
                                style: AppTextStyle.regular.copyWith(
                                  color: AppColors.black,
                                ),
                              ),
                              leading: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: AppColors.monoGrey,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    AppIcons.icNote,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                              trailing: SvgPicture.asset(
                                AppIcons.icArrowRight,
                                color: AppColors.black,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 16,
                              ),
                              dense: false,
                            ),
                          ),
                          const AppCommonDividerWidget(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
