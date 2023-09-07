import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_text_button.dart';
import 'package:aizere_app/common/widgets/app_wbox_widget.dart';
import 'package:aizere_app/common/widgets/screen_wrapper.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/bottom_navigation/presentation/ui/main_bottom_navigation_widget.dart';
import 'package:aizere_app/feature/settings/voice_assistant/presentation/cubit/voice_assistant_cubit.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class VoiceAssistantScreen extends StatelessWidget {
  const VoiceAssistantScreen({
    Key? key,
    this.isStartSetting = true,
  }) : super(key: key);

  final bool isStartSetting;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VoiceAssistantCubit()..initCubit(),
      child: VoiceAssistant(
        isStartSetting: isStartSetting,
      ),
    );
  }
}

class VoiceAssistant extends StatefulWidget {
  const VoiceAssistant({
    Key? key,
    this.isStartSetting = true,
  }) : super(key: key);

  final bool isStartSetting;

  @override
  State<VoiceAssistant> createState() => _VoiceAssistantState();
}

class _VoiceAssistantState extends State<VoiceAssistant> {
  late VoiceAssistantCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<VoiceAssistantCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      body: BlocConsumer<VoiceAssistantCubit, VoiceAssistantState>(
        listener: (context, state) {
          if (state is SuccessAppConfigured) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const MainBottomNavigationScreen(),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is VoiceAssistantCommonState) {
            final double speedVoice = state.speed;
            return Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 20,
                right: 20,
              ),
              child: LayoutBuilder(builder: (context, constraints) {
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
                            child: Column(
                              children: [
                                Text(
                                  context.l10n.voiceAssistant,
                                  style: AppTextStyle.title.copyWith(
                                    fontSize: 28,
                                  ),
                                ),
                                const HBox(
                                  height: 24,
                                ),
                                Text(
                                  context.l10n.aizereVoiceTextOnScreen,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.body,
                                ),
                                const HBox(
                                  height: 40,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${context.l10n.voiceSpeed}:',
                                    style: AppTextStyle.textButtonStyle,
                                  ),
                                ),
                                const HBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppIcons.icTurtle,
                                    ),
                                    const WBox(),
                                    Expanded(
                                      child: SliderTheme(
                                        data: SliderTheme.of(context).copyWith(
                                          trackHeight: 6,
                                          trackShape:
                                              const RoundedRectSliderTrackShape(),
                                          activeTrackColor: AppColors.mainBlue,
                                          inactiveTrackColor:
                                              AppColors.monoGrey,
                                          thumbShape:
                                              const RoundSliderThumbShape(
                                            pressedElevation: 0,
                                            enabledThumbRadius: 12,
                                          ),
                                          rangeTrackShape:
                                              const RoundedRectRangeSliderTrackShape(),
                                          thumbColor: AppColors.mainBlue,
                                          overlayColor: AppColors.monoGrey,
                                          overlayShape:
                                              const RoundSliderOverlayShape(
                                            overlayRadius: 12.0,
                                          ),
                                          tickMarkShape:
                                              const RoundSliderTickMarkShape(),
                                          activeTickMarkColor:
                                              AppColors.mainBlue,
                                          inactiveTickMarkColor:
                                              AppColors.monoGrey,
                                          valueIndicatorShape:
                                              const RectangularSliderValueIndicatorShape(),
                                          valueIndicatorColor:
                                              AppColors.mainBlack,
                                          valueIndicatorTextStyle:
                                              const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        child: Slider(
                                          value: speedVoice,
                                          min: 0.25,
                                          max: 1.75,
                                          divisions: 6,
                                          label:
                                              '${context.l10n.voiceSpeed}: $speedVoice',
                                          onChanged: _cubit.setSpeed,
                                          semanticFormatterCallback:
                                              (double newValue) {
                                            return '${newValue.round()} dollars';
                                          },
                                        ),
                                      ),
                                    ),
                                    const WBox(),
                                    SvgPicture.asset(
                                      AppIcons.icBunny,
                                    ),
                                  ],
                                ),
                                const HBox(
                                  height: 40,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${context.l10n.interaction}:',
                                    style: AppTextStyle.textButtonStyle,
                                  ),
                                ),
                                const HBox(
                                  height: 20,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 6,
                                      height: 6,
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 6,
                                        horizontal: 12,
                                      ),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.mainBlack,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        context.l10n.doubleTapForVoice,
                                        style: AppTextStyle.body,
                                      ),
                                    ),
                                  ],
                                ),
                                const HBox(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 6,
                                      height: 6,
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal: 12,
                                      ),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.mainBlack,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        context
                                            .l10n.holdTwoFingerToChangeVolume,
                                        style: AppTextStyle.body,
                                      ),
                                    ),
                                  ],
                                ),
                                const HBox(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 6,
                                      height: 6,
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 6,
                                        horizontal: 12,
                                      ),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.mainBlack,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        context
                                            .l10n.pressThreeFingerToAizereVoice,
                                        style: AppTextStyle.body,
                                      ),
                                    ),
                                  ],
                                ),
                                const HBox(),
                              ],
                            ),
                          ),
                          if (widget.isStartSetting) ...[
                            const HBox(),
                            AppFilledColorButton(
                              onTap: () {
                                _cubit.setApplicationConfiguredState;
                                context.router.replace(
                                  const OnboardingRoute(),
                                );
                              },
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                              width: double.maxFinite,
                              color: AppColors.mainBlue,
                              child: Text(
                                context.l10n.keepContinue,
                                style: AppTextStyle.textButtonStyle.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                          const HBox(),
                          SizedBox(
                            width: 200,
                            child: AppTextButton(
                              onTap: () => Navigator.pop(context),
                              text: context.l10n.back,
                              style: AppTextStyle.textButtonStyle
                                  .copyWith(color: AppColors.mainBlue),
                            ),
                          ),
                          const HBox(),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
