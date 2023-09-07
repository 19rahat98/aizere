import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_text_button.dart';
import 'package:aizere_app/common/widgets/app_wbox_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/library/data/model/class_composition_model.dart';
import 'package:aizere_app/feature/player/ui/cubit/player_cubit.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class PlayerScreen extends StatefulWidget {
  final ClassComposition classComposition;

  const PlayerScreen({super.key, required this.classComposition});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  double _currentSliderValue = 0;
  late PlayerCubit _cubit;
  double speed = 1.0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) =>
          PlayerCubit()..initCubit(widget.classComposition.link!),
      child: Builder(builder: (context) {
        return BlocBuilder<PlayerCubit, PlayerState>(builder: (context, state) {
          if (state is PlayerCommonState) {
            return Scaffold(
              appBar: const SynthesisCustomAppBar(),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        child: Text(
                          'What is Lorem Ipsum?Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Why do we use it?It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).What is Lorem Ipsum?Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Why do we use it?It is a long established fact that a reader will be distrac',
                          style: AppTextStyle.w400s16.copyWith(
                            color: AppColors.black,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Егіннің бастары',
                          style: AppTextStyle.w600s18.copyWith(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            AppIcons.icShare,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            AppIcons.icHeart,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Ахмет Байтұрсынұлы',
                      style: AppTextStyle.light.copyWith(
                        color: AppColors.monoGrey1,
                      ),
                    ),
                    const HBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 10,
                      child: SliderTheme(
                        data: const SliderThemeData(
                          thumbColor: AppColors.mainBlue,
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 10.0,
                            elevation: 4,
                          ),
                          overlayColor: Colors.transparent,
                        ),
                        child: Slider(
                          value: _currentSliderValue,
                          min: 0,
                          max: state.totalTime.toDouble(),
                          inactiveColor: AppColors.monoGrey,
                          label: _currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
                            });
                            context.read<PlayerCubit>().seekToPosition(value);
                          },
                        ),
                      ),
                    ),
                    const HBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatTime((state).initialTime),
                          style: AppTextStyle.light.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          formatTime((state).totalTime),
                          style: AppTextStyle.light.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                    const HBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          AppIcons.icShuffle,
                        ),
                        SvgPicture.asset(
                          AppIcons.icPrevious,
                        ),
                        IconButton(
                          onPressed: () =>
                              context.read<PlayerCubit>().playAudio(),
                          icon: SvgPicture.asset(
                            state.playerState == 1
                                ? AppIcons.icPlayFilled
                                : AppIcons.icPause,
                            color: AppColors.mainBlue,
                          ),
                          iconSize: 45,
                          splashRadius: 1,
                        ),
                        SvgPicture.asset(
                          AppIcons.icNext,
                        ),
                        SvgPicture.asset(
                          AppIcons.icRepeat,
                        ),
                      ],
                    ),
                    const HBox(
                      height: 10,
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
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     IconButton(
                    //       onPressed: () {},
                    //       splashRadius: 20,
                    //       icon: SvgPicture.asset(
                    //         AppIcons.icImport,
                    //       ),
                    //     ),
                    //     TextButton(
                    //       onPressed: () {},
                    //       child: Text(
                    //         'Скорость',
                    //         style: AppTextStyle.w400s16.copyWith(
                    //           color: AppColors.black,
                    //         ),
                    //       ),
                    //     ),
                    //
                    //   ],
                    // ),
                    const HBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          }
          {
            return Text(
              state.toString(),
            );
          }
        });
      }),
    );
  }
}

class SynthesisCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SynthesisCustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.monoGrey,
          ),
        ),
      ),
      child: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: MediaQuery.of(context).size.width / 2,
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: TextButton(
                onPressed: () => context.router.pop(),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.icArrowLeft,
                      color: AppColors.black,
                      width: 20,
                    ),
                    const WBox(
                      width: 10,
                    ),
                    Text(
                      context.l10n.back,
                      style: AppTextStyle.w400s14.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            splashRadius: 20,
            onPressed: () {},
            icon: SvgPicture.asset(
              AppIcons.icSettings,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}

String formatTime(int timeInSeconds) {
  final minutes = timeInSeconds ~/ 60;
  final seconds = timeInSeconds % 60;
  final formattedMinutes = minutes.toString().padLeft(
        2,
      );
  final formattedSeconds = seconds.toString().padLeft(2, '0');
  return '$formattedMinutes:$formattedSeconds';
}
