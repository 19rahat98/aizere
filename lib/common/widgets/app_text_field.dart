import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String? title;

  const AppTextField({super.key, required this.title});

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
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
            ),
          ),
        ),
      ],
    );
  }
}
