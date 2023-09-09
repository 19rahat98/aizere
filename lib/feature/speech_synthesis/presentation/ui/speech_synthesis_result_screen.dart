import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/common/core/extensions.dart';
import 'package:aizere_app/common/widgets/app_common_divider_widget.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_snack_bar_widget.dart';
import 'package:aizere_app/common/widgets/app_wbox_widget.dart';
import 'package:aizere_app/common/widgets/screen_wrapper.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/speech_synthesis/presentation/cubit/speech_download/speech_cubit.dart';
import 'package:aizere_app/feature/speech_synthesis/presentation/ui/widgets/synthesis_custom_app_bar.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        context.l10n.speaker,
                        style: AppTextStyle.body.copyWith(
                          color: AppColors.ffABB0BC,
                          fontSize: 14,
                        ),
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
                                color: AppColors.ffF0F0F0,
                              ),
                              child: Image.asset(
                                AppIcons.icRaya,
                                width: 24,
                              ),
                            ),
                            const WBox(
                              width: 10,
                            ),
                            Text(
                              context.l10n.aizere,
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
                    thickness: 1,
                    color: AppColors.monoGrey,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.topLeft,
                      decoration: const BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Text(
                          widget.text,
                          style: AppTextStyle.body,
                        ),
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
                        state.totalTime.formatTime(),
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
                      color: AppColors.ffF0F0F0,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: _cubit.playAudio,
                          icon: SvgPicture.asset(_cubit.playPauseIconAsset),
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
                  TextButton(
                    onPressed: () => context.router.pop(),
                    child: Text(
                      context.l10n.newSynthes,
                      style: AppTextStyle.heading,
                    ),
                  )
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
