import 'package:aizere_app/common/widgets/app_custom_app_bar.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_player_list_tile.dart';
import 'package:aizere_app/common/widgets/app_search_textfield.dart';
import 'package:aizere_app/common/widgets/screen_wrapper.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/library/data/model/class_composition_model.dart';
import 'package:aizere_app/feature/search/presentation/cubit/search_cubit.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (context) => SearchCubit(),
      child: const SearchScreenBuilder(),
    );
  }
}

class SearchScreenBuilder extends StatefulWidget {
  const SearchScreenBuilder({Key? key}) : super(key: key);

  @override
  State<SearchScreenBuilder> createState() => _SearchScreenBuilderState();
}

class _SearchScreenBuilderState extends State<SearchScreenBuilder> {
  late SearchCubit _searchCubit;
  late TextEditingController _textController;

  @override
  void initState() {
    _searchCubit = context.read<SearchCubit>();
    _textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      bottom: false,
      backgroundColor: Colors.white,
      appBar: AppCustomAppBar(title: context.l10n.search),
      body: Column(
        children: [
          const HBox(
            height: 20,
          ),
          AppSearchTextField(
            autofocus: true,
            controller: _textController,
            onChanged: _searchCubit.onSearchChanged,
          ),
          const HBox(
            height: 32,
          ),
          BlocConsumer<SearchCubit, SearchState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is SearchSuccessState) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Результаты поиска',
                          style: AppTextStyle.heading.copyWith(
                            fontSize: 18,
                            color: AppColors.black,
                          ),
                        ),
                        const HBox(
                          height: 8,
                        ),
                        Text(
                          'Включи и наслаждайся произведением казахской литературы',
                          style: AppTextStyle.body.copyWith(
                            fontSize: 14,
                            color: AppColors.ffABB0BC,
                          ),
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 32),
                          itemCount: state.bookList.length,
                          separatorBuilder: (context, i) => const HBox(
                            height: 12,
                          ),
                          itemBuilder: (context, index) {
                            return AppPlayerListTile(
                              index: index,
                              classCompositions: state.bookList
                                  .map(
                                    (e) => ClassComposition(
                                      grade: e.grade,
                                      title: e.title,
                                      name: e.name,
                                      id: e.id,
                                      link: e.link,
                                      img: e.img,
                                      textSynthesis: e.textSynthesis,
                                    ),
                                  )
                                  .toList(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is SearchLoadingState) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is SearchEmptyResultState) {
                return const SizedBox();
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'История поиска',
                      style: AppTextStyle.heading.copyWith(
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                    ),
                    const HBox(
                      height: 8,
                    ),
                    Text(
                      'Включи и наслаждайся произведением казахской литературы',
                      style: AppTextStyle.body.copyWith(
                        fontSize: 14,
                        color: AppColors.ffABB0BC,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
