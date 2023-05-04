import 'package:aizere_app/l10n/l10n.dart';
import 'package:flutter/cupertino.dart';

class AppInputDoneView extends StatefulWidget {
  const AppInputDoneView({Key? key, this.onTap}) : super(key: key);

  final Function()? onTap;

  @override
  State<AppInputDoneView> createState() => _AppInputDoneViewState();
}

class _AppInputDoneViewState extends State<AppInputDoneView>
    with SingleTickerProviderStateMixin {
  double height = 0;
  bool isActive = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 500), () {
        isActive
            ? setState(() {
                height = 50;
              })
            : null;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    isActive = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: double.infinity,
        curve: Curves.easeInOutQuint,
        height: height,
        color: CupertinoColors.extraLightBackgroundGray,
        child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
              child: CupertinoButton(
                padding:
                    const EdgeInsets.only(right: 24.0, top: 8.0, bottom: 8.0),
                onPressed: widget.onTap,
                child: Text(
                  context.l10n.start,
                  style: const TextStyle(
                    color: CupertinoColors.activeBlue,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )));
  }
}
