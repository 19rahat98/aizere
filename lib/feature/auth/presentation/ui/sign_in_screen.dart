import 'package:aizere_app/common/widgets/app_filled_color_button.dart';
import 'package:aizere_app/common/widgets/app_text_button.dart';
import 'package:aizere_app/common/widgets/app_text_field.dart';
import 'package:aizere_app/common/widgets/app_title_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/feature/auth/presentation/cubit/auth/sign_in/sign_in_cubit.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:aizere_app/router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => SignInCubit(),
      child: BlocListener<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccessState) {
            context.router.replace(
              SpeechSynthesisBuildRoute(),
            );
          }
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: Column(
              children: [
                AuthTitleWidget(
                  title: context.l10n.auth,
                  text: context.l10n.fillAllFieldsAuth,
                ),
                const SizedBox(
                  height: 40,
                ),
                AuthTextField(
                  title: context.l10n.mail,
                  controller: username,
                  hintText: context.l10n.enterMail,
                ),
                const SizedBox(
                  height: 24,
                ),
                AuthTextField(
                  title: context.l10n.password,
                  controller: password,
                  hintText: context.l10n.enterPassword,
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.l10n.dontHaveAnAccount,
                      style: AppTextStyle.heading,
                    ),
                    AppTextButton(
                      onTap: () =>
                          context.router.replace(const RegistrationRoute()),
                      text: context.l10n.signUp,
                      style: AppTextStyle.heading.copyWith(
                        color: AppColors.mainBlue,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                BlocBuilder<SignInCubit, SignInState>(
                  builder: (context, state) {
                    if (state is SignInCommonState && state.isLoading) {
                      return const CircularProgressIndicator();
                    }

                    return AppFilledColorButton(
                      onTap: () => context.read<SignInCubit>().signIn(
                            username.text,
                            password.text,
                          ),
                      text: context.l10n.enter,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      color: AppColors.mainBlue,
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () => context.router.push(
                    const ForgotPasswordRoute(),
                  ),
                  child: Text(
                    context.l10n.forgotPassword,
                    style: AppTextStyle.heading.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }
}
