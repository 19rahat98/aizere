import 'package:aizere_app/common/widgets/app_common_divider_widget.dart';
import 'package:aizere_app/common/widgets/app_custom_app_bar.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_search_textfield.dart';
import 'package:aizere_app/common/widgets/app_text_button.dart';
import 'package:aizere_app/common/widgets/screen_wrapper.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        child: Column(
          children: [
            const HBox(
              height: 20,
            ),
            const AppSearchTextField(),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      context.l10n.searchHistory,
                      style: AppTextStyle.textButtonStyle,
                    ),
                  ),
                  AppTextButton(
                    onTap: () {},
                    text: context.l10n.clear,
                    style: AppTextStyle.regular.copyWith(
                      color: AppColors.mainBlue,
                    ),
                  ),
                ],
              ),
            ),
            const AppCommonDividerWidget(),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 3,
                separatorBuilder: (_, __) => const AppCommonDividerWidget(),
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    'Егіннің бастары',
                    style: AppTextStyle.body.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: const Text(
                    'Ахмет Байтұрсынұлы',
                    style: AppTextStyle.regular,
                  ),
                  leading: Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.monoGrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SvgPicture.asset(
                      AppIcons.icBook,
                    ),
                  ),
                  trailing: SvgPicture.asset(
                    AppIcons.icPlayFilled,
                    color: AppColors.mainBlue,
                    width: 32,
                    height: 32,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 16,
                  ),
                  dense: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
