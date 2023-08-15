import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_title_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, this.isNewPassword = false});

  final bool? isNewPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
          ),
          SvgPicture.asset(AppIcons.icSuccess),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppTitleWidget(
                title: 'Поздравляем, Жанибек!',
                text: isNewPassword!
                    ? 'Новый пароль для входа доступа к вашему аккаунту создан.'
                    : 'Доступные вам функционалы уже готовы к использованию. Начните задавать вопросы AIzere.'),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: AppFilledColorButton(
              onTap: () {
                context.router.replace(SpeechSynthesisBuildRoute());
              },
              text: 'Завершить',
              padding: const EdgeInsets.symmetric(vertical: 16),
              color: AppColors.mainBlue,
            ),
          ),
        ],
      ),
    );
  }
}
