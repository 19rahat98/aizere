import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/account_details/ui/widgets/settings_textfield.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SettingsDialogWidget extends StatefulWidget {
  const SettingsDialogWidget({
    super.key,
    this.textFields,
    required this.title,
    required this.buttonText,
    this.text,
  });

  final String title;
  final List<String>? textFields;
  final String buttonText;
  final String? text;

  @override
  State<SettingsDialogWidget> createState() => _SettingsDialogWidgetState();
}

class _SettingsDialogWidgetState extends State<SettingsDialogWidget> {
  List<TextEditingController> controllers = [];

  @override
  void initState() {
    widget.textFields?.forEach((element) {
      controllers.add(TextEditingController());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: AppTextStyle.text.copyWith(
                fontSize: 22,
              ),
            ),
            if (widget.text != null)
            ...[
              const HBox(
                height: 24,
              ),
              Text(
                widget.text!,
                style: AppTextStyle.body.copyWith(
                  fontSize: 16,
                ),
              ),
            ],
            const HBox(
              height: 40,
            ),
            if (widget.textFields != null)
              ...List.generate(
                controllers.length,
                (index) => SettingsTextField(
                  controller: controllers[index],
                  hint: widget.textFields![index],
                ),
              ).expand((element) sync* {
                yield element;
                yield const HBox(
                  height: 40,
                );
              }).take(controllers.length * 2 - 1),
            const HBox(
              height: 40,
            ),
            AppFilledColorButton(
              text: widget.buttonText,
              padding: const EdgeInsets.symmetric(vertical: 16),
              color: AppColors.mainBlue,
              onTap: () => context.router.pop(
                controllers.map((e) => e.text).toList(),
              ),
            ),
            const HBox(
              height: 20,
            ),
            Center(
              child: TextButton(
                onPressed: () => context.router.pop(),
                child: const Text(
                  'Отменить',
                  style: AppTextStyle.body,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
