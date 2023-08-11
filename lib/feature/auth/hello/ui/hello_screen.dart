import 'package:aizere_app/common/constants/global_file_extension_constant.dart';
import 'package:aizere_app/common/widgets/app_button.dart';
import 'package:aizere_app/common/widgets/app_title_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/auth/hello/ui/widgets/hello_icons.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: HelloIcons()),
            30.h,
            const AppTitleWidget(
              title: 'Добро пожаловать в AIzere!',
              text:
                  'Более миллионов человек уже используют AIzere, чтобы общаться с искусственным интелектом',
            ),
            const Spacer(),
            AppButton(
                text: 'Регистрация',
                onPressed: () {
                  context.router.push(const RegistrationRoute());
                }),
            20.h,
            AppButton(
              text: 'Вход',
              color: AppColors.ffABB0BC,
              onPressed: () {
                context.router.replace(const SignInRoute());
              },
            )
          ],
        ),
      ),
    );
  }
}
