import 'package:aizere_app/common/constants/global_constant.dart';
import 'package:aizere_app/common/widgets/app_keyboard_overlay.dart';
import 'package:aizere_app/config/theme.dart';
import 'package:aizere_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SynthesisTextField extends StatefulWidget {
  const SynthesisTextField({
    Key? key,
    this.onClear,
    this.canEdit = true,
    this.onTap,
    required this.controller,
  }) : super(key: key);

  final bool canEdit;
  final Function()? onClear;
  final Function()? onTap;
  final TextEditingController controller;

  @override
  State<SynthesisTextField> createState() => _SynthesisTextFieldState();
}

class _SynthesisTextFieldState extends State<SynthesisTextField> {
  FocusNode textFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    textFocusNode.addListener(() {
      bool hasFocus = textFocusNode.hasFocus;
      if (hasFocus) {
        AppKeyboardOverlay.showOverlay(
          context,
          onTap: widget.onTap,
        );
      } else {
        AppKeyboardOverlay.removeOverlay();
      }
    });
  }

  @override
  void dispose() {
    textFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 22,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 2, color: AppColors.monoGrey)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            TextField(
              enabled: widget.canEdit,
              controller: widget.controller,
              style: AppTextStyle.body,
              maxLines: null,
              focusNode: textFocusNode,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                counterText: GlobalConstant.empty,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                hintText: context.l10n.yourText,
                hintStyle: AppTextStyle.body.copyWith(
                  color: AppColors.monoGrey1,
                ),
              ),
            ),
            if (widget.controller.text.isNotEmpty) ...[
              Align(
                alignment: Alignment.bottomRight,
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    splashRadius: 100,
                    onPressed: widget.onClear,
                    constraints: const BoxConstraints(),
                    icon: SvgPicture.asset(
                      AppIcons.icTrash,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
