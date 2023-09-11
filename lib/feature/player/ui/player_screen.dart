import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/common/core/extensions.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_text_button.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:aizere_app/feature/library/data/model/class_composition_model.dart';
import 'package:aizere_app/feature/player/ui/cubit/player_cubit.dart';
import 'package:aizere_app/feature/player/ui/widget/player_app_bar.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class PlayerScreen extends StatefulWidget {
  const PlayerScreen({
    super.key,
    required this.initialIndex,
    required this.classCompositions,
  });

  final int initialIndex;
  final List<ClassComposition> classCompositions;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late int index;

  @override
  void initState() {
    index = widget.initialIndex;

    super.initState();
  }

  ClassComposition get classComposition => widget.classCompositions[index];

  bool get isFirst => index == 0;

  bool get isLast => widget.classCompositions.length == index + 1;

  @override
  Widget build(BuildContext context) {
    final Map<double, String> speedValues = {
      0.25: '0.25',
      0.5: '0.5',
      0.75: '0.75',
      1: context.l10n.usual,
      1.25: '1.25',
      1.5: '1.5',
      1.75: '1.75',
    };

    return BlocProvider(
      lazy: false,
      create: (context) => PlayerCubit()..initCubit(classComposition.link!),
      child: BlocBuilder<PlayerCubit, PlayerState>(
        builder: (context, state) {
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
                          classComposition.textSynthesis ??
                              GlobalConstant.empty,
                          style: AppTextStyle.body.copyWith(
                            fontSize: 16,
                            color: AppColors.black,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          classComposition.title ?? '',
                          style: AppTextStyle.heading.copyWith(
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
                          onPressed: () {
                            context
                                .read<FavoritesCubit>()
                                .addToFavorites(classComposition.id ?? 0);
                          },
                          icon: SvgPicture.asset(
                            AppIcons.icHeart,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      classComposition.name ?? '',
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
                          value: state.initialTime.toDouble(),
                          min: 0,
                          max: state.totalTime.toDouble(),
                          inactiveColor: AppColors.monoGrey,
                          label: state.initialTime.toString(),
                          onChanged: (double value) {
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
                          state.initialTime.formatTime(),
                          style: AppTextStyle.light.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          state.totalTime.formatTime(),
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
                        IconButton(
                          onPressed: !isFirst
                              ? () {
                                  setState(() {
                                    index--;
                                  });
                                  context.read<PlayerCubit>()
                                    ..resetCubit()
                                    ..initCubit(classComposition.link!);
                                }
                              : null,
                          icon: SvgPicture.asset(
                            AppIcons.icPrevious,
                            color: isFirst
                                ? AppColors.monoGrey
                                : AppColors.mainBlue,
                          ),
                        ),
                        IconButton(
                          onPressed: () =>
                              context.read<PlayerCubit>().playAudio(),
                          icon: SvgPicture.asset(
                            context.read<PlayerCubit>().playPauseIconAsset,
                            color: AppColors.mainBlue,
                          ),
                          iconSize: 45,
                          splashRadius: 1,
                        ),
                        IconButton(
                          onPressed: !isLast
                              ? () {
                                  setState(() {
                                    index++;
                                  });
                                  context.read<PlayerCubit>()
                                    ..resetCubit()
                                    ..initCubit(classComposition.link!);
                                }
                              : null,
                          icon: SvgPicture.asset(
                            AppIcons.icNext,
                            color: isLast
                                ? AppColors.monoGrey
                                : AppColors.mainBlue,
                          ),
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
                      children: List.generate(
                        speedValues.length,
                        (index) {
                          final speed = speedValues.entries.elementAt(index);
                          return Flexible(
                            flex: speed.key == 1 ? 0 : 1,
                            child: _buildSpeed(
                              context,
                              speed.key,
                              speed.value,
                              state.speedSpeaker,
                            ),
                          );
                        },
                      ),
                    ),
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
        },
      ),
    );
  }

  Widget _buildSpeed(
    BuildContext context,
    double value,
    String title,
    double currentSpeed,
  ) =>
      AppTextButton(
        onTap: () => context.read<PlayerCubit>().setSpeed(value),
        text: title,
        isCenter: false,
        style: currentSpeed == value
            ? AppTextStyle.light.copyWith(
                color: AppColors.mainBlue,
                fontWeight: FontWeight.w600,
              )
            : AppTextStyle.light,
      );
}
