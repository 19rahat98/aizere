import 'package:aizere_app/common/widgets/app_common_divider_widget.dart';
import 'package:aizere_app/common/widgets/app_custom_app_bar.dart';
import 'package:aizere_app/common/widgets/app_text_button.dart';
import 'package:aizere_app/common/widgets/screen_wrapper.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:aizere_app/feature/speech_synthesis/presentation/ui/speech_synthesis_screen.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late FavoritesCubit _cubit;

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
      body: ColoredBox(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: 10,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      context.l10n.myFavorites,
                      style: AppTextStyle.textButtonStyle,
                    ),
                  ),
                  AppTextButton(
                    onTap: _cubit.removeAll,
                    text: context.l10n.clear,
                    style: AppTextStyle.regular.copyWith(
                      color: AppColors.mainBlue,
                    ),
                  ),
                ],
              ),
            ),
            const AppCommonDividerWidget(),
            BlocBuilder<FavoritesCubit, FavoriteState>(
              builder: (context, state) {
                return ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: state.list.length,
                  separatorBuilder: (context, index) =>
                      const AppCommonDividerWidget(),
                  itemBuilder: (context, index) {
                    return Material(
                      color: Colors.transparent,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 12,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SpeechSynthesisBuildScreen(
                                text: state.list[index],
                              ),
                            ),
                          );
                        },
                        title: Text(
                          state.list[index],
                          maxLines: 3,
                          style: AppTextStyle.light,
                          overflow: TextOverflow.ellipsis,
                        ),
                        leading: Container(
                          width: 48,
                          height: 48,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.monoGrey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: SvgPicture.asset(
                            AppIcons.icVoiceCircle,
                          ),
                        ),
                        trailing: IconButton(
                          icon: SvgPicture.asset(
                            AppIcons.icHeartFilled,
                          ),
                          onPressed: () {
                            _cubit.removeFromFavorites(
                              state.list[index],
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
