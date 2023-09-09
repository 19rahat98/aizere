import 'package:aizere_app/common/widgets/app_wbox_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/library/data/model/class_composition_model.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppPlayerListTile extends StatelessWidget {
  const AppPlayerListTile({
    super.key,
    required this.index,
    required this.classCompositions,
  });

  final int index;
  final List<ClassComposition> classCompositions;

  ClassComposition get classComposition => classCompositions[index];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => context.router.push(
          PlayerRoute(
            initialIndex: index,
            classCompositions: classCompositions,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.monoGrey,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(classComposition.img ?? ''),
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
                  classComposition.title.toString(),
                  style: AppTextStyle.body.copyWith(
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  classComposition.name!,
                  style: AppTextStyle.body.copyWith(
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
