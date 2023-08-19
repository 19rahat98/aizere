import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/common/widgets/app_custom_app_bar.dart';
import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_progess_idicator_button.dart';
import 'package:aizere_app/common/widgets/app_snack_bar_widget.dart';
import 'package:aizere_app/common/widgets/app_text_button.dart';
import 'package:aizere_app/common/widgets/screen_wrapper.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:aizere_app/feature/speech_synthesis/presentation/cubit/speech_cubit.dart';
import 'package:aizere_app/feature/speech_synthesis/presentation/ui/widgets/synthesis_playback_line.dart';
import 'package:aizere_app/feature/speech_synthesis/presentation/ui/widgets/synthesis_text_field.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SpeechSynthesisBuildScreen extends StatelessWidget {
  const SpeechSynthesisBuildScreen({
    Key? key,
    this.text = GlobalConstant.empty,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SpeechCubit>(
      create: (_) => SpeechCubit()..initCubit(),
      child: SpeechSynthesis(
        text: text,
      ),
    );
  }
}

class SpeechSynthesis extends StatefulWidget {
  const SpeechSynthesis({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  State<SpeechSynthesis> createState() => _SpeechSynthesisState();
}

class _SpeechSynthesisState extends State<SpeechSynthesis> {
  late SpeechCubit _cubit;

  late TextEditingController _textController;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light,
    );
    _cubit = context.read<SpeechCubit>();
    _textController = TextEditingController(
      text: widget.text,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      bottom: true,
      appBar: const AppCustomAppBar(
        isSettings: true,
        title: 'Синтез речи',
      ),
      body: BlocBuilder<FavoritesCubit, FavoriteState>(
        builder: (context, favState) {
          return BlocConsumer<SpeechCubit, SpeechState>(
            listener: (context, state) {
              if (state is SpeechDownloadError) {
                final snackBar = errorSnackBar(
                  title: state.error,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else if (state is SpeechSuccessDownloaded) {
                context.read<FavoritesCubit>().loadFavorites();
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
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onVerticalDragDown: (_) {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Column(
                      children: [
                        SynthesisTextField(
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            _cubit.downloadRequisites(
                              _textController.text,
                              favState.list,
                            );
                          },
                          canEdit: !state.isLoading,
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
                        buildButton(
                          state,
                          isConstrain: state.isContain,
                          favList: favState.list,
                        ),
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
                  ),
                );
              }

              return const SizedBox();
            },
          );
        },
      ),
    );
  }

  Widget buildButton(
    SpeechCommonState state, {
    bool isConstrain = false,
    required List<String> favList,
  }) {
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
                favList,
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
          Expanded(
            child: FavoriteButton(
              isConstrain: isConstrain,
              controller: _textController,
              changeFav: _cubit.removeFavoriteState,
            ),
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
                favList,
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
          Expanded(
            child: FavoriteButton(
              isConstrain: isConstrain,
              controller: _textController,
              changeFav: _cubit.removeFavoriteState,
            ),
          ),
        ],
      );
    }

    return AppFilledColorButton(
      onTap: () => _cubit.downloadRequisites(
        _textController.text,
        favList,
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

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    Key? key,
    required this.changeFav,
    required this.isConstrain,
    required this.controller,
  }) : super(key: key);

  final bool isConstrain;
  final Function(bool) changeFav;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 100,
      onPressed: () {
        changeFav(!isConstrain);
        if (isConstrain) {
          context.read<FavoritesCubit>().removeFromFavorites(
                controller.text,
              );
        } else {
          context.read<FavoritesCubit>().addToFavorites(
                controller.text,
              );
        }
      },
      constraints: const BoxConstraints(
        minWidth: 64,
        minHeight: 64,
      ),
      icon: SvgPicture.asset(
        AppIcons.icHeart,
        colorFilter: ColorFilter.mode(
          isConstrain ? AppColors.mainBlack : AppColors.monoGrey,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
