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
      appBar: const AppCustomAppBar(title: 'Уведомления'),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.icNotificationPet)
                  ],
                )
              ],
            );
          },
          separatorBuilder: (c, i) => const SizedBox(
                height: 40,
              ),
          itemCount: 2),
    );
  }
}
