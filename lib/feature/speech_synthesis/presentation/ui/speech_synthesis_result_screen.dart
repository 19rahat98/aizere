import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/common/widgets/app_custom_app_bar.dart';
import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_progess_idicator_button.dart';
import 'package:aizere_app/common/widgets/app_snack_bar_widget.dart';
import 'package:aizere_app/common/widgets/screen_wrapper.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:aizere_app/feature/speech_synthesis/presentation/cubit/speech_cubit.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: MediaQuery.of(context).size.width / 2,
        leading: Row(
          children: [
            Row(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => context.router.pop,
                  splashRadius: 20,
                  icon: SvgPicture.asset(
                    AppIcons.icArrowLeft,
                    color: AppColors.black,
                    width: 20,
                  ),
                ),
                Text(
                  context.l10n.back,
                  style: AppTextStyle.w400s14.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Сохранить',
              style: AppTextStyle.w600s18,
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
                    const HBox(
                      height: 40,
                    ),
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
