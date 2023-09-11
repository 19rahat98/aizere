import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:flutter/material.dart';

class AppSearchTextField extends StatelessWidget {
  const AppSearchTextField({
    Key? key,
    required this.controller,
    required this.onChanged,
    this.autofocus = false,
  }) : super(key: key);

  final bool autofocus;
  final Function(String) onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.monoGrey,
          width: 2,
        ),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: AppTextStyle.body,
        maxLines: 1,
        autofocus: autofocus,
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          counterText: GlobalConstant.empty,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          hintText: context.l10n.search,
          hintStyle: AppTextStyle.body.copyWith(
            color: AppColors.monoGrey1,
          ),
          suffixIconConstraints: const BoxConstraints(
            maxWidth: 24,
            maxHeight: 24,
          ),
        ),
      ),
    );
  }
}
