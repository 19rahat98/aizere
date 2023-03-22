import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SynthesisTextField extends StatelessWidget {
  const SynthesisTextField({
    Key? key,
    this.onClear,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;
  final Function()? onClear;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 22,
        ),
        decoration: BoxDecoration(
          color: AppColors.monoGrey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                style: AppTextStyle.body,
                maxLines: null,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  counterText: GlobalConstant.empty,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  hintText: context.l10n.yourText,
                  hintStyle: AppTextStyle.body.copyWith(
                    color: AppColors.monoGrey1,
                  ),
                ),
              ),
            ),
            if (controller.text.isNotEmpty) ...[
              const HBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    splashRadius: 100,
                    onPressed: onClear,
                    constraints: const BoxConstraints(),
                    icon: SvgPicture.asset(
                      AppIcons.icTrash,
                    ),
                  ),
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}
