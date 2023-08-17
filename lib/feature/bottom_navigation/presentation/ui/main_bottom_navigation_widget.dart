import 'package:aizere_app/feature/bottom_navigation/presentation/cubit/change_index_cubit.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/custom_navigation_bar.dart';

@RoutePage()
class MainBottomNavigationScreen extends StatefulWidget {
  const MainBottomNavigationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainBottomNavigationScreen> createState() =>
      _MainBottomNavigationScreenState();
}

class _MainBottomNavigationScreenState
    extends State<MainBottomNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        SpeechSynthesisBuildRoute(),
        const SearchRoute(),
        const FavoritesRoute(),
        const LibraryRoute(),
      ],
      lazyLoad: false,
      homeIndex: 0,
      animationDuration: const Duration(milliseconds: 0),
      backgroundColor: Colors.white,
      bottomNavigationBuilder: (context, tabsRouter) {
        return MultiBlocListener(
          listeners: [
            BlocListener<ChangeIndexCubit, IndexState>(
              listenWhen: (previous, current) => previous.value == current.value,
              listener: (context, state) {
                if (context.router.canPop()) {
                  context.router.popTop();
                }
              },
            ),
            BlocListener<ChangeIndexCubit, IndexState>(
              listenWhen: (previous, current) => previous.value != current.value,
              listener: (context, state) {
                tabsRouter.setActiveIndex(state.value);
              },
            ),
          ],
          child: CustomNavigationBar(
            selectedIndex: context.watch<ChangeIndexCubit>().state.value,
            changeIndex: context.read<ChangeIndexCubit>().changeState,
          ),
        );
      },
    );
  }
}
