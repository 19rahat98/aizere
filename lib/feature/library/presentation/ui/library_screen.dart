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
            return ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
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
                        onTap: () {
                          context
                              .read<LibraryScreenCubit>()
                              .fetchLibrary(index);
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Все произведение',
                    style:
                        AppTextStyle.w600s18.copyWith(color: AppColors.black),
                  ),
                ),
                const HBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Включи и наслаждайся произведением казахской литературы',
                    style: AppTextStyle.w400s14
                        .copyWith(color: AppColors.ffABB0BC),
                  ),
                ),
                ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return AppPlayerListTile(
                      index: index,
                      classCompositions: state.classCompositions!,
                    );
                  },
                  separatorBuilder: (c, i) => const HBox(
                    height: 30,
                  ),
                  itemCount: state.classCompositions!.length,
                ),
              ],
            );
          }
          {
            return Text(state.toString());
          }
        },
      ),
    );
  }
}

// ColoredBox
// (
// color: Colors.white,
// child: TabBarView(
// controller: _tabController,
// children: List.generate(
// 11,
// (index) => ListView.separated(
// itemCount: 15,
// shrinkWrap: true,
// padding: const EdgeInsets.only(
// top: 64,
// ),
// separatorBuilder: (_, __) => const AppCommonDividerWidget(),
// itemBuilder: (context, index) => Material(
// color: Colors.transparent,
// child: ListTile(
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (_) => const SpeechSynthesisBuildScreen(
// text:
// 'Бір адам жас баласын жанына алды, Екеуі сайран етіп кетіп қалды. Қыдырып әрлі-берлі жүрді дағы, Егінші егін еккен жерге барды.',
// ),
// ),
// );
// },
// title: Text(
// 'Егіннің бастары',
// style: AppTextStyle.body.copyWith(
// fontWeight: FontWeight.w600,
// ),
// ),
// subtitle: const Text(
// 'Ахмет Байтұрсынұлы',
// style: AppTextStyle.regular,
// ),
// leading: Container(
// width: 48,
// height: 48,
// padding: const EdgeInsets.all(12),
// decoration: BoxDecoration(
// color: AppColors.monoGrey,
// borderRadius: BorderRadius.circular(12),
// ),
// child: SvgPicture.asset(
// AppIcons.icBook,
// ),
// ),
// trailing: SvgPicture.asset(
// AppIcons.icPlayFilled,
// color: AppColors.mainBlue,
// width: 32,
// height: 32,
// ),
// contentPadding: const EdgeInsets.symmetric(
// vertical: 6,
// horizontal: 16,
// ),
// dense: false,
// ),
// ),
// ),
// ),
// ),
// ),
