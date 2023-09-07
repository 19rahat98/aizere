import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_wbox_widget.dart';
import 'package:aizere_app/common/widgets/screen_wrapper.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/settings/choose_interface/cubit/interface_type_cubit.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class ChooseInterfaceScreen extends StatelessWidget {
  const ChooseInterfaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InterfaceTypeCubit(),
      child: BlocBuilder<InterfaceTypeCubit, InterfaceType>(
        builder: (context, selectedType) {
          final interfaceTypeCubit = context.read<InterfaceTypeCubit>();

          return ScreenWrapper(
            body: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          context.l10n.chooseInterface,
                          style: AppTextStyle.title.copyWith(
                            fontSize: 28,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const HBox(
                          height: 24,
                        ),
                        Text(
                          context.l10n.interfaceDescription,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.body,
                        ),
                        const HBox(
                          height: 40,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${context.l10n.chooseType}:',
                            style: AppTextStyle.textButtonStyle,
                          ),
                        ),
                        const HBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AppFilledColorButton(
                                onTap: () => interfaceTypeCubit
                                    .setSelectedType(InterfaceType.Standard),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 18,
                                ),
                                color: interfaceTypeCubit
                                    .getButtonColor(InterfaceType.Standard),
                                child: Column(
                                  children: [
                                    Text(
                                      context.l10n.standart,
                                      style: getButtonTextStyle(selectedType ==
                                          InterfaceType.Standard),
                                      textAlign: TextAlign.center,
                                    ),
                                    const HBox(
                                      height: 40,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: SvgPicture.asset(
                                        AppIcons.icLetters,
                                      ),
                                    ),
                                    const HBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const WBox(),
                            Expanded(
                              child: AppFilledColorButton(
                                onTap: () => interfaceTypeCubit.setSelectedType(
                                    InterfaceType.SpecialCapabilities),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 18,
                                ),
                                color: interfaceTypeCubit.getButtonColor(
                                    InterfaceType.SpecialCapabilities),
                                child: Column(
                                  children: [
                                    Text(
                                      context.l10n.specialCapabilities,
                                      style: getButtonTextStyle(selectedType ==
                                          InterfaceType.SpecialCapabilities),
                                      textAlign: TextAlign.center,
                                    ),
                                    const HBox(
                                      height: 40,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: SvgPicture.asset(
                                        AppIcons.icGlasses,
                                      ),
                                    ),
                                    const HBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const HBox(),
                  AppFilledColorButton(
                    onTap: () => context.router.push(
                      ChooseLocaleRoute(),
                    ),
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    color: AppColors.mainBlue,
                    child: Text(
                      context.l10n.keepContinue,
                      style: AppTextStyle.textButtonStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

TextStyle getButtonTextStyle(bool value) {
  if (value) {
    return AppTextStyle.textButtonStyle.copyWith(
      color: Colors.white,
    );
  }

  return AppTextStyle.textButtonStyle.copyWith(
    fontWeight: FontWeight.w400,
    color: AppColors.mainBlack,
  );
}
