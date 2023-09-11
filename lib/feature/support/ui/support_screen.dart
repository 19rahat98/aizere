import 'package:aizere_app/common/widgets/app_custom_app_bar.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/profile/ui/widgets/tile_category_widget.dart';
import 'package:aizere_app/utils/extensions/list_extension.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppCustomAppBar(
        title: 'Центр поддержки',
        isSettings: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: TileCategoryWidget(
          data: _option(context),
        ),
      ),
    );
  }

  TileCategoryWidgetData _option(BuildContext context) =>
      TileCategoryWidgetData(
        'Общее',
        [AppIcons.icQuestion, AppIcons.icSms],
        ['Вопросы и ответы', 'Связаться с нами'],
        [null] * 2,
        [null] * 2,
      );
}
