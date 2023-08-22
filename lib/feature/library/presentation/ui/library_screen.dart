import 'package:aizere_app/common/widgets/app_custom_app_bar.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  List<int> itemList = List.generate(11, (index) => index);
  int selectedItemIndex = 0;

  /// доделать
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppCustomAppBar(title: context.l10n.library),
      body: ListView(
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
                final isItemSelected = index == selectedItemIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedItemIndex = isItemSelected ? -1 : index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isItemSelected
                            ? AppColors.mainBlue
                            : AppColors.monoGrey,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: isItemSelected
                                ? AppColors.mainBlue
                                : AppColors.ffABB0BC,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 11,
                          ),
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${index + 1} класс',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
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

          /// Сомнительно, но пока ничего лучше не придумал
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Все произведение',
              style: AppTextStyle.w600s18.copyWith(color: AppColors.black),
            ),
          ),
          const HBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Включи и наслаждайся произведением казахской литературы',
              style: AppTextStyle.w400s14.copyWith(color: AppColors.ffABB0BC),
            ),
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Material(
                  color: Colors.transparent,
                  child: ListTile(
                    onTap: () {},
                    title: Text('Егіннің бастары',
                        style: AppTextStyle.w600s16
                            .copyWith(color: AppColors.black)),
                    subtitle: Text(
                      'Ахмет Байтұрсынұлы',
                      style: AppTextStyle.w400s14
                          .copyWith(color: AppColors.ffABB0BC),
                    ),
                    leading: Container(
                      width: 60,
                      decoration: BoxDecoration(
                        color: AppColors.monoGrey,
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                            image: NetworkImage(
                              'https://picsum.photos/1000/1000',
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    trailing: SvgPicture.asset(
                      AppIcons.icPlayFilled,
                      color: AppColors.mainBlue,
                      width: 32,
                      height: 32,
                    ),
                    dense: false,
                  ),
                );
              },
              separatorBuilder: (c, i) => const HBox(
                    height: 20,
                  ),
              itemCount: 5)
        ],
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
