import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TileCategoryWidgetData {
  TileCategoryWidgetData(
    this.title,
    this.icons,
    this.options,
    this.actions,
  ) {
    assert(options.length == icons.length);
    assert(options.length == actions.length);
  }

  final String title;
  final List<String> icons;
  final List<String> options;
  final List<void Function()?> actions;
}

class TileCategoryWidget extends StatelessWidget {
  const TileCategoryWidget({
    super.key,
    required this.data,
    this.widget,
  });

  final Widget? widget;
  final TileCategoryWidgetData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            data.title,
            style: AppTextStyle.heading.copyWith(
              color: AppColors.grayBlue,
              fontSize: 16,
            ),
          ),
        ),
        ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 24),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: data.actions[index],
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      data.icons[index],
                      color: AppColors.black,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      data.options[index],
                      style: AppTextStyle.body.copyWith(
                        fontSize: 16,
                        color: AppColors.black,
                      ),
                    ),
                    const Spacer(),
                    widget ?? SvgPicture.asset(AppIcons.icArrowRight)
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (c, i) => const SizedBox(height: 8),
          itemCount: data.options.length,
        )
      ],
    );
  }
}
