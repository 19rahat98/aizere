import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/common/widgets/app_snack_bar_widget.dart';
import 'package:aizere_app/common/widgets/app_text_button.dart';
import 'package:aizere_app/common/widgets/app_text_field.dart';
import 'package:aizere_app/common/widgets/app_title_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/auth/presentation/cubit/auth/sign_up/sign_up_cubit.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final username = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          context.router.push(
            ConfirmationRoute(username: username.text, name: name.text),
          );
        } else if (state is SignUpFailureState) {
          final snackBar = errorSnackBar(
            title: state.errorMessage ?? context.l10n.errorMessage,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: Column(
            children: [
              HBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              AuthTitleWidget(
                title: context.l10n.signUp,
                text: context.l10n.fillAllFieldsSignUp,
              ),
              const HBox(
                height: 40,
              ),
              AuthTextField(
                title: context.l10n.name,
                controller: name,
                hintText: context.l10n.exampleAizere,
              ),
              const HBox(
                height: 24,
              ),
              AuthTextField(
                title: context.l10n.mail,
                controller: username,
                hintText: context.l10n.enterMail,
              ),
              const HBox(
                height: 24,
              ),
              AuthTextField(
                title: context.l10n.password,
                controller: password,
                hintText: context.l10n.enterPassword,
              ),
              const HBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.l10n.haveAnAccount,
                    style: AppTextStyle.heading,
                  ),
                  AppTextButton(
                    onTap: () => context.router.replace(const SignInRoute()),
                    text: context.l10n.enter,
                    style: AppTextStyle.heading.copyWith(
                      color: AppColors.mainBlue,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              AppFilledColorButton(
                onTap: () => context.read<SignUpCubit>().signUp(
                      username.text,
                      password.text,
                      name.text,
                    ),
                text: context.l10n.continueText,
                color: AppColors.mainBlue,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    name.dispose();
    username.dispose();
    password.dispose();
    super.dispose();
  }
}
