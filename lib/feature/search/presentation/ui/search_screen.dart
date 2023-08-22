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
        child: ListView(
          children: [
            const HBox(
              height: 20,
            ),
            const AppSearchTextField(),
            const HBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'История поиска',
                style: AppTextStyle.w600s18.copyWith(color: AppColors.black),
              ),
            ),
            const HBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Включи и наслаждайся произведением казахской литературы',
                style: AppTextStyle.w400s14.copyWith(color: AppColors.ffABB0BC),
              ),
            ),
            ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 40),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Material(
                    color: Colors.transparent,
                    child: ListTile(
                      onTap: () {},
                      title: Text('Егіннің бастары',
                          style: AppTextStyle.w600s16
                              .copyWith(color: AppColors.black)),
                      subtitle: Text(
                        'Ахмет Байтұрсынұлы',
                        style: AppTextStyle.w400s14
                            .copyWith(color: AppColors.ffABB0BC),
                      ),
                      leading: Container(
                        width: 60,
                        decoration: BoxDecoration(
                          color: AppColors.monoGrey,
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                              image: NetworkImage(
                                'https://picsum.photos/1000/1000',
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      trailing: SvgPicture.asset(
                        AppIcons.icPlayFilled,
                        color: AppColors.mainBlue,
                        width: 32,
                        height: 32,
                      ),
                      dense: false,
                    ),
                  );
                },
                separatorBuilder: (c, i) => const HBox(
                      height: 20,
                    ),
                itemCount: 3),
          ],
        ),
      ),
    );
  }
}
