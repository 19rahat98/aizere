import 'package:aizere_app/common/widgets/app_custom_app_bar.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/notifications/ui/notifications_screen.dart';
import 'package:aizere_app/feature/profile/ui/widgets/tile_category_widget.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppCustomAppBar(
        title: 'Настройка',
        isSettings: true,
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
          'Приложение',
          [
            AppIcons.icVoiceSquare,
            AppIcons.icMusic,
            AppIcons.icBell,
            AppIcons.icLamp,
            AppIcons.icFaceId,
            AppIcons.icGlobal,
          ],
          [
            'Голос',
            'Музыка',
            'Уведомления',
            'Темный режим',
            'Face-ID',
            'Язык',
          ],
          [
            null,
            null,
            () => context.router.push(const NotificationsRoute()),
            null,
            null,
            () => context.router.push(const ChangeLanguageRoute()),
          ],
          [
            SizedBox(
              height: 20,
              child: Slider(
                value: 0.6,
                onChanged: (value) {},
                activeColor: AppColors.mainBlue,
                inactiveColor: AppColors.monoGrey,
              ),
            ),
            SizedBox(
              height: 20,
              child: Slider(
                value: 0.2,
                onChanged: (value) {},
                activeColor: AppColors.mainBlue,
                inactiveColor: AppColors.monoGrey,
              ),
            ),
            SizedBox(
              height: 20,
              child: Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: AppColors.mainBlue,
                    trackColor: AppColors.grayBlue),
              ),
            ),
            SizedBox(
              height: 20,
              child: Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: AppColors.mainBlue,
                    trackColor: AppColors.grayBlue),
              ),
            ),
            SizedBox(
              height: 20,
              child: Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: AppColors.mainBlue,
                    trackColor: AppColors.grayBlue),
              ),
            ),
            null,
          ],
        ),
        TileCategoryWidgetData(
          'Общее',
          [AppIcons.icDocument],
          ['Правила и Условия'],
          [null],
          [null],
        ),
      ];
}
