import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarIconItemWidget extends StatelessWidget {
  const NavBarIconItemWidget({
    Key? key,
    this.iconColor,
    this.textColor,
    required this.title,
    required this.iconName,
  }) : super(key: key);

  final String iconName;
  final Color? iconColor;
  final Color? textColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          iconName,
          color: iconColor,
          width: 24,
          height: 24,
          //color: iconColor,
        ),
        const HBox(
          height: 4,
        ),
        Material(
          color: Colors.transparent,
          child: Text(
            title,
            style: AppTextStyle.light.copyWith(
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
}
