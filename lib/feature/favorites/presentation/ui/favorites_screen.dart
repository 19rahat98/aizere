import 'package:aizere_app/common/widgets/app_category_widget.dart';
import 'package:aizere_app/common/widgets/app_custom_app_bar.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/screen_wrapper.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late FavoritesCubit _cubit;
  List<String> itemList = ['Библиотека', 'Синтез речи'];
  int selectedItemIndex = 0;

  @override
  void didChangeDependencies() {
    _cubit = context.read<FavoritesCubit>();
    _cubit.loadFavorites();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      bottom: false,
      appBar: AppCustomAppBar(title: context.l10n.favorite),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        children: [
          SizedBox(
            height: 40,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final isItemSelected = index == selectedItemIndex;
                return AppCategoryWidget(
                  label: '${index + 2}',
                  text: itemList[index],
                  isSelected: isItemSelected,
                  onTap: () {
                    setState(() {
                      selectedItemIndex = index;
                    });
                  },
                );
              },
              separatorBuilder: (c, i) => const SizedBox(
                width: 8,
              ),
              itemCount: itemList.length,
            ),
          ),
          const HBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              itemList[selectedItemIndex],
              style: AppTextStyle.heading.copyWith(
                fontSize: 18,
                color: AppColors.black,
              ),
            ),
          ),
          const HBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Включи и наслаждайся произведением казахской литературы',
              style: AppTextStyle.body.copyWith(
                fontSize: 14,
                color: AppColors.ffABB0BC,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
