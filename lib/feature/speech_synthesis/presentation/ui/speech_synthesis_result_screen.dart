import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_progess_idicator_button.dart';
import 'package:aizere_app/common/widgets/app_snack_bar_widget.dart';
import 'package:aizere_app/common/widgets/app_wbox_widget.dart';
import 'package:aizere_app/common/widgets/screen_wrapper.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:aizere_app/feature/speech_synthesis/presentation/cubit/speech_cubit.dart';
import 'package:aizere_app/feature/speech_synthesis/presentation/ui/widgets/synthesis_custom_app_bar.dart';
import 'package:aizere_app/l10n/l10n.dart';
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
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SpeechCubit>(
      create: (_) => SpeechCubit()..initCubit(),
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
      appBar: const SynthesisCustomAppBar(),
      body: BlocConsumer<SpeechCubit, SpeechState>(
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
                                'Алтын',
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
                              Icons.add,
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
                      height: MediaQuery.of(context).size.height / 2.5,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: AppColors.monoGrey),
                        ),
                      ),
                      child: const SingleChildScrollView(
                        child: Text(
                          'Президентіміз Қасым-Жомарт Кемелұлы Тоқаевтың жолдауында айтылғандай, қазір білім сапасын арттыру, оның ішінде білім беру ұйымдарын цифрландыру мәселесіне ерекше көңіл бөліп отырПрезидентіміз Қасым-Жомарт Кемелұлы Тоқаевтың жолдауында айтылғандай, қазір білім сапасын арттыру, оның ішінде білім беру ұйымдарын цифрландыру мәселесіне ерекше көңіл бөліп отырПрезидентіміз Қасым-Жомарт Кемелұлы Тоқаевтың жолдауында айтылғандай, қазір білім сапасын арттыру, оның ішінде білім беру ұйымдарын цифрландыру мәселесіне ерекше көңіл бөліп отырПрезидентіміз Қасым-Жомарт Кемелұлы Тоқаевтың жолдауында айтылғандай, қазір білім сапасын арттыру, оның ішінде білім беру ұйымдарын цифрландыру мәселесіне ерекше көңіл бөліп отыр',
                          style: AppTextStyle.body,
                        ),
                      ),
                    ),
                    const HBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.icClock),
                        const WBox(
                          width: 10,
                        ),
                        const Text('00:01:23')
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
                          SvgPicture.asset(
                            AppIcons.icPlayFilled,
                            height: 35,
                            color: AppColors.mainBlue,
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
                        ))
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

  Widget buildButton(
    SpeechCommonState state, {
    bool isConstrain = false,
    required List<String> favList,
  }) {
    if (state.isLoading) {
      return const AppProgressIndicatorButton();
    } else if (state.playerState == 1) {
      return AppFilledColorButton(
        onTap: _cubit.playAudio,
        color: AppColors.mainBlue,
        padding: const EdgeInsets.symmetric(vertical: 16),
        width: double.maxFinite,
        text: 'Начать синтез',
      );
    } else if (state.playerState == 2) {
      return AppFilledColorButton(
        onTap: _cubit.playAudio,
        text: 'Начать синтез',
        padding: const EdgeInsets.symmetric(vertical: 16),
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
