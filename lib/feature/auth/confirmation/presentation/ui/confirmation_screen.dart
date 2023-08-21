import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_text_field.dart';
import 'package:aizere_app/common/widgets/app_title_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/auth/confirmation/presentation/cubit/timer_cubit.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key, this.isForgotPass = false});

  final bool? isForgotPass;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerCubit()..init(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          child: Column(
            children: [
              AuthTitleWidget(
                  title: context.l10n.confirmationCode,
                  text:
                      context.l10n.confirmationDescription),
              const SizedBox(
                height: 40,
              ),
              AuthTextField(
                title: context.l10n.confirmationCode,
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
                onTap: () {
                  isForgotPass!
                      ? context.router.replace(const ChangePasswordRoute())
                      : context.router.replace(SuccessRoute());
                },
                text: context.l10n.continueText,
                padding: const EdgeInsets.symmetric(vertical: 16),
                color: AppColors.mainBlue,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () => context.router.pop(),
                child: Text(
                  context.l10n.back,
                  style: AppTextStyle.text.copyWith(color: AppColors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
