import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';

class ChangeInfoWidget extends StatelessWidget {
  const ChangeInfoWidget(
      {super.key,
      required this.title,
      required this.text,
      required this.onPressed});

  final String title;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.heading.copyWith(
            fontSize: 16,
            color: AppColors.grayBlue,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: AppTextStyle.body.copyWith(
                color: AppColors.black,
                fontSize: 16,
              ),
            ),
            TextButton(
              onPressed: onPressed,
              child: Text(
                'Редактировать',
                style: AppTextStyle.body
                    .copyWith(color: AppColors.grayBlue, fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
