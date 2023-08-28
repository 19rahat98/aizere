import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';

/// Textfield который имеет title над собой. Нужен чтобы показать то что данные в textfield Required
class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {super.key,
      this.controller,
      required this.title,
      this.hintText,
      this.maxLength});

  final String? title;
  final TextEditingController? controller;
  final String? hintText;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: title ?? '',
                    style: AppTextStyle.light.copyWith(fontSize: 16)),
                TextSpan(
                  text: '*',
                  style: AppTextStyle.light
                      .copyWith(color: AppColors.errorRed, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.lavender),
          child: TextField(
            controller: controller,
            maxLength: maxLength,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              counterText: '',
              hintText: hintText,
              hintStyle: AppTextStyle.light
                  .copyWith(fontSize: 14, color: AppColors.grayBlue),
            ),
          ),
        ),
      ],
    );
  }
}
