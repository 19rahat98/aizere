import 'package:aizere_app/common/widgets/app_button.dart';
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
  final bool? isForgotPass;

  const ConfirmationScreen({super.key, this.isForgotPass = false});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerCubit()..init(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppTitleWidget(
                  title: 'Подтверждения кода',
                  text:
                      'На ваш номер телефона отправлен 4 значный SMS код подтверждения. Введите код в поле ниже.'),
              const SizedBox(
                height: 40,
              ),
              const AppTextField(
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
                        style: AppTextStyle.body
                            .copyWith(color: AppColors.mainBlue),
                      );
                    },
                  ),
                ],
              ),
              const Spacer(),
              AppButton(
                text: 'Продолжить',
                onPressed: () {
                  isForgotPass!
                      ? context.router.replace(const ChangePasswordRoute())
                      : context.router.replace(SuccessRoute());
                },
              ),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                text: 'Назад',
                color: Colors.transparent,
                textColor: AppColors.black,
                onPressed: () {
                  context.router.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
