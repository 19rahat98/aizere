import 'package:aizere_app/common/widgets/app_custom_app_bar.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_search_textfield.dart';
import 'package:aizere_app/common/widgets/screen_wrapper.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      bottom: false,
      appBar: AppCustomAppBar(title: context.l10n.search),
      body: ColoredBox(
        color: Colors.white,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          children: [
            const HBox(
              height: 20,
            ),
            const AppSearchTextField(),
            const HBox(
              height: 32,
            ),
            Text(
              'История поиска',
              style: AppTextStyle.heading.copyWith(
                fontSize: 18,
                color: AppColors.black,
              ),
            ),
            const HBox(
              height: 8,
            ),
            Text(
              'Включи и наслаждайся произведением казахской литературы',
              style: AppTextStyle.body.copyWith(
                fontSize: 14,
                color: AppColors.ffABB0BC,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
