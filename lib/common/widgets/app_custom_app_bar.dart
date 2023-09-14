import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/settings/app_setting/presentation/ui/app_settings_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppCustomAppBar({
    super.key,
    required this.title,
    this.isSettings = false,
  });

  final String title;
  final bool isSettings;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.monoGrey,
          ),
        ),
      ),
      child: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: buildLeading(context),
        actions: buildActions(context),
        title: isSettings
            ? Text(
                title,
                style: AppTextStyle.heading.copyWith(
                  color: AppColors.black,
                ),
              )
            : Text(
                title,
                style: AppTextStyle.heading.copyWith(color: AppColors.black),
              ),
      ),
    );
  }

  Widget? buildLeading(BuildContext context) {
    if (isSettings) {
      return IconButton(
        padding: EdgeInsets.zero,
        onPressed: () => context.router.pop(),
        splashRadius: 20,
        icon: SvgPicture.asset(
          width: 20,
          AppIcons.icArrowLeft,
          color: AppColors.black,
        ),
      );
    }
    return null;
  }

  List<Widget>? buildActions(BuildContext context) {
    if (!isSettings) {
      return [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AppSettingScreen(),
              ),
            );
          },
          splashRadius: 20,
          constraints: const BoxConstraints(),
          icon: SvgPicture.asset(
            AppIcons.icInfoCircle,
            color: AppColors.black,
          ),
        ),
      ];
    }

    return null;
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
