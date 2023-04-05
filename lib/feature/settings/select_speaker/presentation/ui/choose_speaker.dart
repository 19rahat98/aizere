import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_text_button.dart';
import 'package:aizere_app/common/widgets/app_wbox_widget.dart';
import 'package:aizere_app/common/widgets/screen_wrapper.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/settings/select_speaker/presentation/cubit/app_speaker_cubit.dart';
import 'package:aizere_app/feature/settings/select_speaker/presentation/ui/widgets/speaker_grid.dart';
import 'package:aizere_app/feature/settings/voice_assistant/presentation/ui/voice_assistant.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChooseSpeaker extends StatelessWidget {
  const ChooseSpeaker({
    Key? key,
    this.isStartSetting = true,
  }) : super(key: key);

  final bool isStartSetting;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppSpeakerCubit>(
      create: (_) => AppSpeakerCubit()..initCubit(),
      child: ChooseSpeakerScreen(
        isStartSetting: isStartSetting
      ),
    );
  }
}

class ChooseSpeakerScreen extends StatefulWidget {
  const ChooseSpeakerScreen({
    Key? key,
    this.isStartSetting = true,
  }) : super(key: key);

  final bool isStartSetting;

  @override
  State<ChooseSpeakerScreen> createState() => _ChooseSpeakerState();
}

class _ChooseSpeakerState extends State<ChooseSpeakerScreen> {
  late AppSpeakerCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<AppSpeakerCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      body: BlocConsumer<AppSpeakerCubit, AppSpeakerState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AppSpeakerCommonState) {
            final isRaya = state.speakerId == 0;
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
                          context.l10n.chooseSpeaker,
                          style: AppTextStyle.title.copyWith(
                            fontSize: 28,
                          ),
                        ),
                        const HBox(
                          height: 24,
                        ),
                        Text(
                          context.l10n.chooseVoiceSpeaker,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.body,
                        ),
                        const HBox(
                          height: 40,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${context.l10n.chooseSpeaker}:',
                            style: AppTextStyle.textButtonStyle,
                          ),
                        ),
                        const HBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SpeakerGrid(
                                onTap: () => _cubit.changeSpeakerId(0),
                                isSelected: isRaya,
                                name: context.l10n.aizere,
                                imageName: AppImages.icRaya,
                              ),
                            ),
                            const WBox(),
                            Expanded(
                              child: SpeakerGrid(
                                onTap: () => _cubit.changeSpeakerId(1),
                                isSelected: !isRaya,
                                name: context.l10n.iseke,
                                imageName: AppImages.icIseke,
                              ),
                            ),
                          ],
                        ),
                        const HBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppIcons.icInfoCircle,
                            ),
                            const WBox(),
                            Text(
                              context.l10n.speakerOnlyKazakh,
                              style: AppTextStyle.textButtonStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (widget.isStartSetting) ...[
                    const HBox(),
                    AppFilledColorButton(
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
                    ),
                  ],
                  const HBox(),
                  AppTextButton(
                    onTap: () => Navigator.pop(context),
                    text: context.l10n.back,
                    style: AppTextStyle.textButtonStyle,
                  ),
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
}
