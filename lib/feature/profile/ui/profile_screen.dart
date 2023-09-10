import 'package:aizere_app/common/widgets/app_custom_app_bar.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/profile/ui/widgets/tile_category_widget.dart';
import 'package:aizere_app/router/router.dart';
import 'package:aizere_app/utils/extensions/list_extension.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppCustomAppBar(
        title: 'Мой профиль',
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
        ),
        physics: const BouncingScrollPhysics(),
        children:
            _options(context).map((e) => TileCategoryWidget(data: e)).toList(),
      ),
    );
  }

  List<TileCategoryWidgetData> _options(BuildContext context) => [
        TileCategoryWidgetData(
          'Личное',
          [AppIcons.icPerson, AppIcons.icBell, AppIcons.icGear],
          ['Детали аккаунта', 'Уведомления', 'Настройки'],
          [
            () => context.router.push(
                  const AccountDetailsRoute(),
                ),
            null,
            () => context.router.push(SettingsRoute()),
          ],
          [null] * 3,
        ),
        TileCategoryWidgetData(
          'Сообщество',
          [AppIcons.icProfileAdd],
          ['Пригласить друга'],
          [null],
          [null],
        ),
        TileCategoryWidgetData(
            'Поддержи нас',
            [AppIcons.icInstagram, AppIcons.icStar],
            ['Подписаться на Instagram', 'Оценить приложение'],
            [null] * 2,
            [null] * 2),
        TileCategoryWidgetData(
          'Есть вопросы?',
          [AppIcons.icWarning],
          ['Центр поддержки'],
          [
            () => context.router.push(const SupportRoute()),
          ],
          [null],
        ),
      ];
}
