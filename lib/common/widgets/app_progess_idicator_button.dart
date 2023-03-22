import 'package:aizere_app/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// виджет лоадер поверх другиъ виджетов
class AppProgressIndicatorButton extends StatefulWidget {
  const AppProgressIndicatorButton({Key? key}) : super(key: key);

  @override
  State<AppProgressIndicatorButton> createState() =>
      _AppProgressIndicatorButtonState();
}

class _AppProgressIndicatorButtonState extends State<AppProgressIndicatorButton>
    with TickerProviderStateMixin {
  // Create a controller
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: false);

  // Create an animation with value of type "double"
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.mainBlue,
        border: Border.all(
          width: 5,
          color: AppColors.monoGrey,
        ),
      ),
      duration: const Duration(seconds: 10000000),
      child: Center(
        child: RotationTransition(
          turns: _animation,
          child: SvgPicture.asset(
            AppIcons.icLoader,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
