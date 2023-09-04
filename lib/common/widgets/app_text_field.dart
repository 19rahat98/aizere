import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/common/widgets/app_hbox_widget.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Textfield который имеет title над собой. Нужен чтобы показать то что данные в textfield Required
class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    this.controller,
    required this.title,
    this.hintText,
    this.maxLength,
    this.isPassword = false,
  });

  /// максимальная длина символов
  final int? maxLength;

  /// значение текстового поля
  final String? title;

  /// указываем текст подсказки
  final String? hintText;

  /// флаг для опередения пароля (ЕСЛИ УКАЗАН ДАННЫЙ ФЛАГ, ТО ДРУГИЕ ИКОНКИ С ЛЕВОЙ СТОРОНЫ НЕ БУДУТ ОТОБРАЖАТЬСЯ)
  final bool isPassword;

  /// контроллер для ввода текста
  final TextEditingController? controller;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  /// флаг указывающий на скрыть/паказать пароль
  var _isViewPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: widget.title ?? GlobalConstant.empty,
                  style: AppTextStyle.light.copyWith(fontSize: 16),
                ),
                TextSpan(
                  text: '*',
                  style: AppTextStyle.light.copyWith(
                    color: AppColors.errorRed,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        const HBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: AppColors.lavender,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: widget.controller,
            maxLength: widget.maxLength,
            obscureText: widget.isPassword ? _isViewPassword : false,
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                left: 16,
                top: widget.isPassword ? 12 : 0,
              ),
              counterText: GlobalConstant.empty,
              hintStyle: AppTextStyle.light.copyWith(
                fontSize: 14,
                color: AppColors.grayBlue,
              ),
              suffixIcon: _getTrailingWidget(),
            ),
          ),
        ),
      ],
    );
  }

  Widget? _getTrailingWidget() {
    final isPassword = widget.isPassword;

    if (isPassword) {
      return Padding(
        padding: const EdgeInsets.only(right: 22),
        child: InkWell(
          onTap: () {
            setState(() {
              _isViewPassword = !_isViewPassword;
            });
          },
          child: SvgPicture.asset(
            _isViewPassword
                ? AppIcons.icVisibilityOffPassword
                : AppIcons.icVisibilityPassword,
            color: AppColors.mainBlack,
          ),
        ),
      );
    }

    return null;
  }
}
