import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:flutter/material.dart';

class SynthesisTextField extends StatelessWidget {
  const SynthesisTextField({
    Key? key,
    this.onClear,
    this.canEdit = true,
    required this.controller,
  }) : super(key: key);

  final bool canEdit;
  final Function()? onClear;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 22,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 2, color: AppColors.monoGrey),
      ),
      child: TextField(
        enabled: canEdit,
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
    );
  }
}
