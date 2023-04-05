import 'package:aizere_app/common/widgets/app_common_divider_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:flutter/material.dart';

class LibraryTabBarIndicator extends StatelessWidget {
  const LibraryTabBarIndicator({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: TabBar(
              isScrollable: true,
              controller: controller,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              unselectedLabelStyle: AppTextStyle.regular.copyWith(
                fontWeight: FontWeight.w600,
              ),
              labelStyle: AppTextStyle.regular.copyWith(
                color: AppColors.mainBlack,
                fontWeight: FontWeight.w600,
              ),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 5,
                  color: AppColors.mainBlue,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
              ),
              labelColor: AppColors.mainBlack,
              tabs: List.generate(
                11,
                (index) {
                  final value = index + 1;
                  return Text(
                    context.l10n.classOf(value),
                    maxLines: 1,
                  );
                },
              ),
            ),
          ),
          const AppCommonDividerWidget(
            height: 1,
            indentValue: 0,
          ),
        ],
      ),
    );
  }
}
