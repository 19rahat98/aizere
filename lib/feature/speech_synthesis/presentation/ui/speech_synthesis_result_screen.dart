import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/common/widgets/app_common_divider_widget.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_snack_bar_widget.dart';
import 'package:aizere_app/common/widgets/app_wbox_widget.dart';
import 'package:aizere_app/common/widgets/screen_wrapper.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/speech_synthesis/presentation/cubit/speech_cubit.dart';
import 'package:aizere_app/feature/speech_synthesis/presentation/ui/widgets/synthesis_custom_app_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SpeechSynthesisResultScreen extends StatelessWidget {
  const SpeechSynthesisResultScreen({
    Key? key,
    this.text = GlobalConstant.empty,
    required this.cubit,
  }) : super(key: key);

  final String text;
  final SpeechCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: SpeechSynthesisResult(
        text: text,
      ),
    );
  }
}

class SpeechSynthesisResult extends StatefulWidget {
  const SpeechSynthesisResult({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  State<SpeechSynthesisResult> createState() => _SpeechSynthesisResultState();
}

class _SpeechSynthesisResultState extends State<SpeechSynthesisResult> {
  late SpeechCubit _cubit;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light,
    );
    _cubit = context.read<SpeechCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      bottom: true,
      appBar: const SynthesisCustomAppBar(),
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
                    Row(
                      children: [
                        Text(
                          'Спикер',
                          style: AppTextStyle.w400s16
                              .copyWith(color: AppColors.ffABB0BC),
                        ),
                        const WBox(
                          width: 16,
                        ),
                        Container(
                          padding: const EdgeInsets.all(
                            4,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                100,
                              ),
                              color: AppColors.mainBlue),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(
                                  4,
                                ),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.ffF0F0F0),
                                child: Image.asset(
                                  AppIcons.icRaya,
                                  width: 24,
                                ),
                              ),
                              const WBox(
                                width: 10,
                              ),
                              Text(
                                'Айзере',
                                style: AppTextStyle.text.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              const WBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.ffD8EBFF),
                            child: const Icon(
                              Icons.favorite_border,
                              color: AppColors.mainBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 40,
                      thickness: 1,
                      color: AppColors.monoGrey,
                    ),
                    Container(
                      height: 320,
                      alignment: Alignment.topLeft,
                      decoration: const BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Text(
                          widget.text,
                          style: AppTextStyle.body,
                        ),
                      ),
                    ),
                    const AppCommonDividerWidget(),
                    const HBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.icClock),
                        const WBox(
                          width: 10,
                        ),
                        Text(
                          formatTime(state.totalTime),
                        )
                      ],
                    ),
                    const HBox(
                      height: 15,
                    ),
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          color: AppColors.ffF0F0F0),
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: _cubit.playAudio,
                            icon: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  50,
                                ),
                                color: AppColors.mainBlue,
                              ),
                              padding: const EdgeInsets.all(
                                4,
                              ),
                              child: Icon(
                                state.playerState == 1
                                    ? Icons.play_arrow
                                    : Icons.pause,
                                color: Colors.white,
                              ),
                            ),
                            // icon: state.playerState == 1
                            //     ? SvgPicture.asset(
                            //   AppIcons.icPlayFilled,
                            //   height: 35,
                            //   color: AppColors.mainBlue,
                            // ) : Icon(Icons.pause),
                            // onPressed: _cubit.playAudio,
                          ),
                          const WBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                color: AppColors.mainBlue,
                                borderRadius: BorderRadius.circular(
                                  8,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Новый синтез',
                        style: AppTextStyle.w600s18,
                      ),
                    )
                  ],
                ),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}

String formatTime(int seconds) {
  int hours = seconds ~/ 3600;
  int minutes = (seconds % 3600) ~/ 60;
  int remainingSeconds = seconds % 60;

  String formattedHours = hours.toString().padLeft(2, '0');
  String formattedMinutes = minutes.toString().padLeft(2, '0');
  String formattedSeconds = remainingSeconds.toString().padLeft(2, '0');

  return '$formattedHours:$formattedMinutes:$formattedSeconds';
}

//   Widget buildButton(
//     SpeechCommonState state, {
//     bool isConstrain = false,
//   }) {
//     if (state.isLoading) {
//       return const AppProgressIndicatorButton();
//     } else if (state.playerState == 1) {
//       return AppFilledColorButton(
//         onTap: _cubit.playAudio,
//         color: AppColors.mainBlue,
//         padding: const EdgeInsets.symmetric(vertical: 16),
//         width: double.maxFinite,
//         text: 'Начать синтез',
//       );
//     } else if (state.playerState == 2) {
//       return AppFilledColorButton(
//         onTap: _cubit.playAudio,
//         text: 'Начать синтез',
//         padding: const EdgeInsets.symmetric(vertical: 16),
//       );
//     }
//
//     return AppFilledColorButton(
//       onTap: () => _cubit.downloadRequisites(
//         _textController.text,
//       ),
//       width: 200,
//       height: 54,
//       color: AppColors.mainBlue,
//       borderRadiusRadii: 100,
//       child: Text(
//         context.l10n.start,
//         style: AppTextStyle.textButtonStyle.copyWith(
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }

//  Widget buildButton(
//     SpeechCommonState state, {
//     bool isConstrain = false,
//     required List<String> favList,
//   }) {
//     if (state.isLoading) {
//       return const AppProgressIndicatorButton();
//     } else if (state.playerState == 1) {
//       return AppFilledColorButton(
//         onTap: _cubit.playAudio,
//         color: AppColors.mainBlue,
//         padding: const EdgeInsets.symmetric(vertical: 16),
//         width: double.maxFinite,
//         text: 'Начать синтез',
//       );
//     } else if (state.playerState == 2) {
//       return AppFilledColorButton(
//         onTap: _cubit.playAudio,
//         text: 'Начать синтез',
//         padding: const EdgeInsets.symmetric(vertical: 16),
//       );
//     }
//
//     return AppFilledColorButton(
//       onTap: () => _cubit.downloadRequisites(
//         _textController.text,
//         favList,
//       ),
//       width: 200,
//       height: 54,
//       color: AppColors.mainBlue,
//       borderRadiusRadii: 100,
//       child: Text(
//         context.l10n.start,
//         style: AppTextStyle.textButtonStyle.copyWith(
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }
