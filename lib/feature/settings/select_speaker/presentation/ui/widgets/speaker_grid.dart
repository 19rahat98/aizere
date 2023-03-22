import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpeakerGrid extends StatelessWidget {
  const SpeakerGrid({
    Key? key,
    required this.name,
    required this.onTap,
    required this.imageName,
    this.isSelected = false,
  }) : super(key: key);

  final String name;
  final String imageName;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppFilledColorButton(
          onTap: onTap,
          height: 200,
          color: AppColors.monoGrey,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                left: 30,
                right: 30,
                bottom: 0,
                child: Image.asset(
                  imageName,
                  fit: BoxFit.fitHeight,
                ),
              ),
              if (isSelected)
                Positioned(
                  top: 16,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    AppIcons.icTickCircle,
                  ),
                ),
            ],
          ),
        ),
        const HBox(
          height: 12,
        ),
        Text(
          name,
          style: AppTextStyle.body,
        ),
      ],
    );
  }
}
