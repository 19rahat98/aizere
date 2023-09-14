import 'package:aizere_app/common/widgets/app_custom_app_bar.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/account_details/ui/widgets/change_info_widget.dart';
import 'package:aizere_app/feature/account_details/ui/widgets/settings_dialog_widget.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppCustomAppBar(
        isSettings: true,
        title: 'Детали аккаунта',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                ChangeInfoWidget(
                  title: 'Имя',
                  text: 'John Doe',
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          const SettingsDialogWidget(
                        title: 'Изменить имя',
                        textFields: ['Введите имя'],
                        buttonText: 'Сохранить',
                      ),
                    );
                  },
                ),
                ChangeInfoWidget(
                  title: 'Номер телефона',
                  text: '+7 (747) 777-77-77',
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          const SettingsDialogWidget(
                        title: 'Изменить номер',
                        textFields: ['Введите номер'],
                        buttonText: 'Сохранить',
                      ),
                    );
                  },
                ),
                ChangeInfoWidget(
                  title: 'Пароль',
                  text: 'Скрыто',
                  onPressed: () async {
                    final oldPassword = await showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          const SettingsDialogWidget(
                        title: 'Изменить пароль',
                        textFields: ['Введите пароль'],
                        buttonText: 'Продолжить',
                      ),
                    );
                    print(oldPassword);
                    if (context.mounted && oldPassword != null) {
                      final newPassword = await showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            const SettingsDialogWidget(
                          title: 'Введите новый пароль',
                          textFields: [
                            'Введите новый пароль',
                            'Повторите новый пароль',
                          ],
                          buttonText: 'Сохранить',
                        ),
                      );
                      print(newPassword);
                    }
                  },
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                text:
                    'Если вы удалите свой аккаунт, то восстановить будет не возможно.\n',
                style: AppTextStyle.body,
                children: [
                  WidgetSpan(
                    child: InkWell(
                      onTap: () =>
                          context.router.push(const DeleteAccountRoute()),
                      child: Text(
                        'Удалить аккаунт',
                        style: AppTextStyle.body.copyWith(
                          color: AppColors.red,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  final newName = await showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        const SettingsDialogWidget(
                      text:
                          'Вы точно хотите выйти из аккаунта?\nВесь последующий прогресс не будет сохранен.',
                      title: 'Выйти из аккаунта',
                      buttonText: 'Остаться авторизованным',
                    ),
                  );
                  print(newName);
                },
                child: const Text(
                  'Выйти из аккаунта',
                  style: AppTextStyle.body,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
