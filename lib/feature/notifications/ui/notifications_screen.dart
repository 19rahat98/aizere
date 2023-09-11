import 'package:aizere_app/common/widgets/app_custom_app_bar.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppCustomAppBar(
        title: 'Уведомления',
        isSettings: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 20,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          index == 0 ? AppColors.mainBlue : Colors.transparent,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset(
                    AppIcons.icNotificationPet,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Обновление v2.0.6',
                        style: AppTextStyle.text.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Сегодня, 19:23',
                        style: AppTextStyle.light.copyWith(
                          fontSize: 14,
                          color: AppColors.grayBlue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(
                  16,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.lavender,
                ),
                child: Text(
                  'Приглашаем на фестиваль Almaty Dev 2023, который пройдет по адресу ул. Абая 256. Бесплатный вход и напитки.',
                  style: AppTextStyle.light.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (c, i) => const SizedBox(
          height: 40,
        ),
        itemCount: 2,
      ),
    );
  }
}
