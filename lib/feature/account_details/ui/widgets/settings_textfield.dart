import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';

class SettingsTextField extends StatelessWidget {
  const SettingsTextField({super.key, required this.hint, this.controller});

  final String hint;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lavender,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          hintStyle: AppTextStyle.body.copyWith(
            fontSize: 16,
            color: AppColors.grayBlue,
          ),
          contentPadding: const EdgeInsets.only(
            left: 16,
          ),
        ),
      ),
    );
  }
}
