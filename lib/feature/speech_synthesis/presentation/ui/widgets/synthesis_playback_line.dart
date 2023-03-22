import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';

class SynthesisPlaybackLine extends StatelessWidget {
  const SynthesisPlaybackLine({
    Key? key,
    required this.totalDuration,
    required this.initialPosition,
  }) : super(key: key);

  final int totalDuration;
  final int initialPosition;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 32,
            bottom: 8,
          ),
          child: LinearProgressIndicator(
            minHeight: 4,
            value: progressValue(),
            color: AppColors.mainBlue,
            backgroundColor: AppColors.monoGrey,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              toSeconds(initialPosition),
              style: AppTextStyle.regular.copyWith(
                fontSize: 13,
                color: AppColors.monoGrey1,
              ),
            ),
            Text(
              toSeconds(totalDuration),
              style: AppTextStyle.regular.copyWith(
                fontSize: 13,
                color: AppColors.monoGrey1,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String toSeconds(int value) {
    if (value == 0) {
      return '0:00';
    } else {
      final second = value / 60;
      return second.toStringAsFixed(2).replaceAll('.', ':');
    }
  }

  double progressValue() {
    if (totalDuration == 0 || initialPosition == 0) {
      return 0;
    }
    return initialPosition / totalDuration;
  }
}
