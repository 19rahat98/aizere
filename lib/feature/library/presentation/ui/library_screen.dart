import 'package:aizere_app/common/widgets/app_category_widget.dart';
import 'package:aizere_app/common/widgets/app_custom_app_bar.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_player_list_tile.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/library/presentation/cubit/library_screen_cubit.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  List<int> itemList = List.generate(11, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppCustomAppBar(title: context.l10n.library),
      body: BlocBuilder<LibraryScreenCubit, LibraryScreenState>(
        builder: (context, state) {
          if (state is LibraryScreenCommonState) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return AppCategoryWidget(
                          label: '${index + 1}',
                          text: 'класс',
                          isSelected: state.grade == index,
                          onTap: () => context
                              .read<LibraryScreenCubit>()
                              .fetchLibrary(index),
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
                      'Все произведение',
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      'Включи и наслаждайся произведением казахской литературы',
                      style: AppTextStyle.body.copyWith(
                        fontSize: 14,
                        color: AppColors.ffABB0BC,
                      ),
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      vertical: 40,
                      horizontal: 20,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.classCompositions?.length ?? 0,
                    itemBuilder: (context, index) {
                      return AppPlayerListTile(
                        index: index,
                        classCompositions: state.classCompositions!,
                      );
                    },
                    separatorBuilder: (c, i) => const HBox(
                      height: 30,
                    ),
                  ),
                ],
              ),
            );
          }

          return Text(state.toString());
        },
      ),
    );
  }
}
