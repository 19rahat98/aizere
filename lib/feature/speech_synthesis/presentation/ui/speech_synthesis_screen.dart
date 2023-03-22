import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_progess_idicator_button.dart';
import 'package:aizere_app/common/widgets/app_snack_bar_widget.dart';
import 'package:aizere_app/common/widgets/app_text_button.dart';
import 'package:aizere_app/common/widgets/screen_wrapper.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/settings/app_setting/presentation/ui/app_settings_screen.dart';
import 'package:aizere_app/feature/speech_synthesis/presentation/cubit/speech_cubit.dart';
import 'package:aizere_app/feature/speech_synthesis/presentation/ui/widgets/synthesis_playback_line.dart';
import 'package:aizere_app/feature/speech_synthesis/presentation/ui/widgets/synthesis_text_field.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpeechSynthesisBuild extends StatelessWidget {
  const SpeechSynthesisBuild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SpeechCubit>(
      create: (_) => SpeechCubit()..initCubit(),
      child: const SpeechSynthesisScreen(),
    );
  }
}

class SpeechSynthesisScreen extends StatefulWidget {
  const SpeechSynthesisScreen({Key? key}) : super(key: key);

  @override
  State<SpeechSynthesisScreen> createState() => _SpeechSynthesisScreenState();
}

class _SpeechSynthesisScreenState extends State<SpeechSynthesisScreen> {
  late SpeechCubit _cubit;

  late TextEditingController _textController;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light,
    );
    _cubit = context.read<SpeechCubit>();
    _textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      bottom: false,
      backGround: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        automaticallyImplyLeading: false,
        title: SvgPicture.asset(
          AppIcons.icLogo,
          height: 24,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AppSettingScreen(),
                ),
              );
            },
            splashRadius: 20,
            constraints: const BoxConstraints(),
            icon: SvgPicture.asset(
              AppIcons.icInfoCircle,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: BlocConsumer<SpeechCubit, SpeechState>(
        listener: (context, state) {
          if (state is SpeechDownloadError) {
            final snackBar = errorSnackBar(
              title: state.error,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        buildWhen: (prev, current) => current is SpeechCommonState,
        builder: (context, state) {
          if (state is SpeechCommonState) {
            final speed = state.speedSpeaker;
            return Container(
              padding: const EdgeInsets.only(
                top: 24,
                left: 20,
                right: 20,
                bottom: 10,
              ),
              color: Colors.white,
              child: Column(
                children: [
                  SynthesisTextField(
                    onClear: () {
                      _cubit.stopAudio();
                      _textController.clear();
                    },
                    controller: _textController,
                  ),
                  SynthesisPlaybackLine(
                    totalDuration: state.totalTime,
                    initialPosition: state.initialTime,
                  ),
                  const HBox(),
                  buildButton(state),
                  const HBox(
                    height: 30,
                  ),
                  Text(
                    context.l10n.playbackSpeed,
                    style: AppTextStyle.regular.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  const HBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: AppTextButton(
                          onTap: () => _cubit.setSpeed(0.25),
                          text: '0.25',
                          isCenter: false,
                          style: speed == 0.25
                              ? AppTextStyle.light.copyWith(
                                  color: AppColors.mainBlue,
                                  fontWeight: FontWeight.w600,
                                )
                              : AppTextStyle.light,
                        ),
                      ),
                      Flexible(
                        child: AppTextButton(
                          onTap: () => _cubit.setSpeed(0.5),
                          text: '0.5',
                          isCenter: false,
                          style: speed == 0.5
                              ? AppTextStyle.light.copyWith(
                                  color: AppColors.mainBlue,
                                  fontWeight: FontWeight.w600,
                                )
                              : AppTextStyle.light,
                        ),
                      ),
                      Flexible(
                        child: AppTextButton(
                          onTap: () => _cubit.setSpeed(0.75),
                          text: '0.75',
                          isCenter: false,
                          style: speed == 0.75
                              ? AppTextStyle.light.copyWith(
                                  color: AppColors.mainBlue,
                                  fontWeight: FontWeight.w600,
                                )
                              : AppTextStyle.light,
                        ),
                      ),
                      AppTextButton(
                        onTap: () => _cubit.setSpeed(1),
                        isCenter: false,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        text: context.l10n.usual,
                        style: speed == 1
                            ? AppTextStyle.light.copyWith(
                                color: AppColors.mainBlue,
                                fontWeight: FontWeight.w600,
                              )
                            : AppTextStyle.light,
                      ),
                      Flexible(
                        child: AppTextButton(
                          onTap: () => _cubit.setSpeed(1.25),
                          text: '1.25',
                          isCenter: false,
                          style: speed == 1.25
                              ? AppTextStyle.light.copyWith(
                                  color: AppColors.mainBlue,
                                  fontWeight: FontWeight.w600,
                                )
                              : AppTextStyle.light,
                        ),
                      ),
                      Flexible(
                        child: AppTextButton(
                          onTap: () => _cubit.setSpeed(1.5),
                          text: '1.5',
                          isCenter: false,
                          style: speed == 1.5
                              ? AppTextStyle.light.copyWith(
                                  color: AppColors.mainBlue,
                                  fontWeight: FontWeight.w600,
                                )
                              : AppTextStyle.light,
                        ),
                      ),
                      Flexible(
                        child: AppTextButton(
                          onTap: () => _cubit.setSpeed(1.75),
                          text: '1.75',
                          isCenter: false,
                          style: speed == 1.75
                              ? AppTextStyle.light.copyWith(
                                  color: AppColors.mainBlue,
                                  fontWeight: FontWeight.w600,
                                )
                              : AppTextStyle.light,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget buildButton(SpeechCommonState state) {
    if (state.isLoading) {
      return const AppProgressIndicatorButton();
    } else if (state.playerState == 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: IconButton(
              splashRadius: 100,
              onPressed: () => _cubit.downloadRequisites(
                _textController.text,
              ),
              constraints: const BoxConstraints(
                minWidth: 64,
                minHeight: 64,
              ),
              icon: SvgPicture.asset(
                AppIcons.icRepeat,
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              splashRadius: 100,
              onPressed: _cubit.playAudio,
              constraints: const BoxConstraints(
                minWidth: 64,
                minHeight: 64,
              ),
              icon: SvgPicture.asset(
                AppIcons.icPlayFilled,
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
        ],
      );
    } else if (state.playerState == 2) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: IconButton(
              splashRadius: 100,
              onPressed: () => _cubit.downloadRequisites(
                _textController.text,
              ),
              constraints: const BoxConstraints(
                minWidth: 64,
                minHeight: 64,
              ),
              icon: SvgPicture.asset(
                AppIcons.icRepeat,
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              splashRadius: 100,
              onPressed: _cubit.playAudio,
              constraints: const BoxConstraints(
                minWidth: 64,
                minHeight: 64,
              ),
              icon: SvgPicture.asset(
                AppIcons.icPause,
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
        ],
      );
    }

    return AppFilledColorButton(
      onTap: () => _cubit.downloadRequisites(
        _textController.text,
      ),
      width: 200,
      height: 54,
      color: AppColors.mainBlue,
      borderRadiusRadii: 100,
      child: Text(
        context.l10n.start,
        style: AppTextStyle.textButtonStyle.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
