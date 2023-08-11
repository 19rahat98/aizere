import 'dart:async';

import 'package:aizere_app/common/constants/global_file_extension_constant.dart';
import 'package:aizere_app/common/widgets/app_button.dart';
import 'package:aizere_app/common/widgets/app_text_field.dart';
import 'package:aizere_app/common/widgets/app_title_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ConfirmationScreen extends StatefulWidget {
  ///пока лучше не придумал
  final bool? isForgotPass;

  const ConfirmationScreen({super.key, this.isForgotPass = false});

  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  int _remainingTime = 179;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            40.h,
            const AppTextField(
              title: 'Код подтверждения',
            ),
            32.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Повторно отправить через: ',
                  style: AppTextStyle.body,
                ),
                Text(
                  '${_remainingTime ~/ 60}:${(_remainingTime % 60).toString().padLeft(2, '0')}',
                  style: AppTextStyle.body.copyWith(color: AppColors.mainBlue),
                ),
              ],
            ),
            const Spacer(),
            AppButton(
              text: 'Продолжить',
              onPressed: () {
                widget.isForgotPass!
                    ? context.router.replace(const NewPasswordRoute())
                    : context.router.replace(SuccessRoute());
              },
            ),
            20.h,
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
    );
  }
}
