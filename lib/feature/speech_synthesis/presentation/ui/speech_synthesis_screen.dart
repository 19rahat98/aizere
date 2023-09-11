import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/common/widgets/app_custom_app_bar.dart';
import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_progess_idicator_button.dart';
import 'package:aizere_app/common/widgets/app_snack_bar_widget.dart';
import 'package:aizere_app/common/widgets/app_wbox_widget.dart';
import 'package:aizere_app/common/widgets/screen_wrapper.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/speech_synthesis/presentation/cubit/speech_download/speech_cubit.dart';
import 'package:aizere_app/feature/speech_synthesis/presentation/ui/widgets/synthesis_text_field.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
      child: SpeechSynthesis(text: text),
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
      appBar: AppCustomAppBar(
        title: context.l10n.speechSynthesis,
      ),
      body: BlocConsumer<SpeechCubit, SpeechState>(
        listener: (context, state) {
          if (state is SpeechDownloadError) {
            final snackBar = errorSnackBar(
              title: state.error,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          if (state is SpeechSuccessDownloaded) {
            context.router.push(
              SpeechSynthesisResultRoute(
                text: _textController.text,
                audioPath: state.audioPath,
              ),
            );
          }
        },
        buildWhen: (prev, current) => current is SpeechCommonState,
        builder: (context, state) {
          if (state is SpeechCommonState) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    child: SynthesisTextField(
                      canEdit: !state.isLoading,
                      onClear: _textController.clear,
                      controller: _textController,
                    ),
                  ),
                  const HBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.mainBlue,
                      ),
                      borderRadius: BorderRadius.circular(
                        100,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          AppIcons.icNote,
                        ),
                        const WBox(
                          width: 4,
                        ),
                        Text(
                          context.l10n.paste,
                          style: AppTextStyle.text.copyWith(
                            fontSize: 15,
                            color: AppColors.mainBlue,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  const HBox(
                    height: 20,
                  ),
                  buildButton(state),
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
    }

    return AppFilledColorButton(
      onTap: () {
        if (_textController.text.trim().isNotEmpty) {
          FocusScope.of(context).unfocus();
          _cubit.downloadRequisites(_textController.text);
        } else {
          final snackBar = errorSnackBar(
            title: 'Поле обязательно для заполнения',
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
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
