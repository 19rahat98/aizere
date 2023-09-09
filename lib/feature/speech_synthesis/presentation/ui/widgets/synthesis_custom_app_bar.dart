import 'package:aizere_app/common/widgets/app_wbox_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SynthesisCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SynthesisCustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.monoGrey,
          ),
        ),
      ),
      child: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: MediaQuery.of(context).size.width / 2,
        leading: Row(
          children: [
            TextButton(
              onPressed: () => context.router.pop(),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.icArrowLeft,
                    color: AppColors.black,
                    width: 20,
                  ),
                  const WBox(
                    width: 10,
                  ),
                  Text(
                    context.l10n.back,
                    style: AppTextStyle.body.copyWith(
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Сохранить',
              style: AppTextStyle.heading,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
