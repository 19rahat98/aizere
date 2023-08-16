import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_text_field.dart';
import 'package:aizere_app/common/widgets/app_title_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/auth/confirmation/presentation/cubit/timer_cubit.dart';
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
              const AuthTitleWidget(
                  title: 'Подтверждения кода',
                  text:
                      'На ваш номер телефона отправлен 4 значный SMS код подтверждения. Введите код в поле ниже.'),
              const SizedBox(
                height: 40,
              ),
              const AuthTextField(
                title: 'Код подтверждения',
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Повторно отправить через: ',
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
                text: 'Продолжить',
                padding: const EdgeInsets.symmetric(vertical: 16),
                color: AppColors.mainBlue,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () => context.router.pop(),
                child: Text(
                  'Назад',
                  style: AppTextStyle.w600s17.copyWith(color: AppColors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
