import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_snack_bar_widget.dart';
import 'package:aizere_app/common/widgets/app_text_field.dart';
import 'package:aizere_app/common/widgets/app_title_widget.dart';
import 'package:aizere_app/common/widgets/screen_wrapper.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/auth/presentation/cubit/auth/sign_up/sign_up_cubit.dart';
import 'package:aizere_app/feature/auth/presentation/cubit/timer/timer_cubit.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({
    super.key,
    this.name,
    required this.username,
    this.isForgotPass = false,
  });

  final String? name;
  final String username;
  final bool isForgotPass;

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  final code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerCubit()..init(),
      child: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is EmailConfirmSuccessState) {
            context.router.replace(
              SuccessRoute(name: widget.name),
            );
          } else if (state is SignUpFailureState) {
            final snackBar = errorSnackBar(
              title: state.errorMessage ?? context.l10n.errorMessage,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: ScreenWrapper(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              children: [
                const HBox(height: 16),
                AuthTitleWidget(
                  title: context.l10n.confirmationCode,
                  text: context.l10n.confirmationDescription,
                ),
                const SizedBox(
                  height: 40,
                ),
                AuthTextField(
                  title: context.l10n.confirmationCode,
                  controller: code,
                  maxLength: 4,
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.l10n.sendItBack,
                      style: AppTextStyle.body,
                    ),
                    BlocBuilder<TimerCubit, int>(
                      builder: (context, state) {
                        return Text(
                          '${state ~/ 60}:${(state % 60).toString().padLeft(2, '0')}',
                          style: AppTextStyle.body.copyWith(
                            color: AppColors.mainBlue,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const Spacer(),
                AppFilledColorButton(
                  onTap: onTapButton,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  text: context.l10n.continueText,
                  color: AppColors.mainBlue,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () => context.router.pop(),
                  child: Text(
                    context.l10n.back,
                    style: AppTextStyle.heading.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTapButton() {
    if (widget.isForgotPass) {
      context.router.replace(const ChangePasswordRoute());
    } else {
      context.read<SignUpCubit>().emailConfirmation(widget.username, code.text);
    }
  }

  @override
  void dispose() {
    code.dispose();
    super.dispose();
  }
}
