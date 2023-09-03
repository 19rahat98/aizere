import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_text_button.dart';
import 'package:aizere_app/common/widgets/app_wbox_widget.dart';
import 'package:aizere_app/common/widgets/screen_wrapper.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/language_logic/data/models/language.dart';
import 'package:aizere_app/feature/language_logic/presentation/cubit/local_language_cubit.dart';
import 'package:aizere_app/feature/settings/choose_local/presentation/cubit/setting_app_local_cubit.dart';
import 'package:aizere_app/feature/settings/voice_assistant/presentation/ui/voice_assistant.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ChooseLocaleScreen extends StatelessWidget {
  const ChooseLocaleScreen({
    Key? key,
    this.isStartSetting = true,
  }) : super(key: key);

  final bool isStartSetting;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingAppLocalCubit>(
      create: (_) => SettingAppLocalCubit()..initCubit(),
      child: ChooseLocale(
        isStartSetting: isStartSetting,
      ),
    );
  }
}

class ChooseLocale extends StatefulWidget {
  const ChooseLocale({
    Key? key,
    this.isStartSetting = true,
  }) : super(key: key);

  final bool isStartSetting;

  @override
  State<ChooseLocale> createState() => _ChooseLocaleState();
}

class _ChooseLocaleState extends State<ChooseLocale> {
  late SettingAppLocalCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<SettingAppLocalCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      body: BlocConsumer<SettingAppLocalCubit, SettingAppLocalState>(
        listener: (context, state) {
          if (state is SettingAppLocalCommonState) {
            context.read<LocalLanguageCubit>().changeLocalApp(
                  LanguageEntity(
                    code: state.appLocal,
                    value: state.appLocal == 1 ? 'ru' : 'kk',
                  ),
                );
          }
        },
        builder: (context, state) {
          if (state is SettingAppLocalCommonState) {
            final bool isKazakh = state.appLocal == 2;
            return Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          context.l10n.selectLanguage,
                          style: AppTextStyle.title.copyWith(
                            fontSize: 28,
                          ),
                        ),
                        const HBox(
                          height: 24,
                        ),
                        Text(
                          context.l10n.selectLanguageInterface,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.body,
                        ),
                        const HBox(
                          height: 40,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${context.l10n.selectLanguage}:',
                            style: AppTextStyle.textButtonStyle,
                          ),
                        ),
                        const HBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AppFilledColorButton(
                                onTap: () => _cubit.changeLocal(2),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 18,
                                ),
                                color: isKazakh
                                    ? AppColors.mainBlue
                                    : AppColors.monoGrey,
                                child: Text(
                                  context.l10n.kazakh,
                                  style: getButtonTextStyle(isKazakh),
                                ),
                              ),
                            ),
                            const WBox(),
                            Expanded(
                              child: AppFilledColorButton(
                                onTap: () => _cubit.changeLocal(1),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 18,
                                ),
                                color: !isKazakh
                                    ? AppColors.mainBlue
                                    : AppColors.monoGrey,
                                child: Text(
                                  context.l10n.russian,
                                  style: getButtonTextStyle(!isKazakh),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const HBox(),
                  buildFloatButton(),
                  const HBox(),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget buildFloatButton() {
    if (widget.isStartSetting) {
      return AppFilledColorButton(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const VoiceAssistant(),
            ),
          );
        },
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        child: Text(
          context.l10n.keepContinue,
          style: AppTextStyle.textButtonStyle.copyWith(
            color: Colors.white,
          ),
        ),
      );
    }

    return AppTextButton(
      onTap: () => Navigator.pop(context),
      text: context.l10n.back,
      style: AppTextStyle.textButtonStyle,
    );
  }

  TextStyle getButtonTextStyle(bool value) {
    if (value) {
      return AppTextStyle.textButtonStyle.copyWith(
        color: Colors.white,
      );
    }

    return AppTextStyle.textButtonStyle.copyWith(
      fontWeight: FontWeight.w400,
      color: AppColors.mainBlack,
    );
  }
}
