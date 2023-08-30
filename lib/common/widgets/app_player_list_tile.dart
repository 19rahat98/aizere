import 'package:aizere_app/common/widgets/app_wbox_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppPlayerListTile extends StatelessWidget {
  const AppPlayerListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.monoGrey,
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: NetworkImage('https://picsum.photos/1000/1000'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const WBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Егіннің бастары',
                  style: AppTextStyle.w600s16.copyWith(
                    color: AppColors.black,
                  ),
                ),
                Text(
                  'Ахмет Байтұрсынұлы',
                  style: AppTextStyle.w400s14.copyWith(
                    color: AppColors.ffABB0BC,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              AppIcons.icPlayFilled,
              color: AppColors.mainBlue,
              width: 32,
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
