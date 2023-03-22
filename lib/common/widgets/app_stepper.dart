import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';

class AppStepper extends StatelessWidget {
  const AppStepper({
    Key? key,
    this.length = 0,
    this.currentIndex = 0,
  }) : super(key: key);

  final int length;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8,
      child: ListView.builder(
        itemCount: length,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          if (index == currentIndex) {
            return Container(
              width: 24,
              height: 8,
              margin: const EdgeInsets.only(
                right: 4,
              ),
              decoration: BoxDecoration(
                color: AppColors.mainBlue,
                borderRadius: BorderRadius.circular(100),
              ),
            );
          }

          return Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(
              right: 4,
            ),
            decoration: const BoxDecoration(
              color: AppColors.monoGrey,
              shape: BoxShape.circle,
            ),
          );
        },
      ),
    );
  }
}
