import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';

/// Textfield который имеет title над собой. Нужен чтобы показать то что данные в textfield Required
class AuthTextField extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;

  const AuthTextField({
    super.key,
    this.controller,
    required this.title,
  });

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
                TextSpan(text: title ?? '', style: AppTextStyle.w400s16),
                TextSpan(
                  text: '*',
                  style:
                      AppTextStyle.w400s16.copyWith(color: AppColors.ffE82C2C),
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
              color: AppColors.ffF6F5FA),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
            ),
          ),
        ),
      ],
    );
  }
}
