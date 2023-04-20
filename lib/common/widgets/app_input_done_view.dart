import 'package:aizere_app/l10n/l10n.dart';
import 'package:flutter/cupertino.dart';

class AppInputDoneView extends StatelessWidget {
  const AppInputDoneView({Key? key, this.onTap}) : super(key: key);

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: CupertinoColors.extraLightBackgroundGray,
        child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
              child: CupertinoButton(
                padding:
                    const EdgeInsets.only(right: 24.0, top: 8.0, bottom: 8.0),
                onPressed: onTap,
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
