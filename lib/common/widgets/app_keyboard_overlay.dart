import 'package:flutter/material.dart';
import 'package:flutter_persistent_keyboard_height/flutter_persistent_keyboard_height.dart';

import 'app_input_done_view.dart';

class AppKeyboardOverlay {
  static OverlayEntry? _overlayEntry;

  static showOverlay(BuildContext context, {Function()? onTap}) {
    if (_overlayEntry != null) {
      return;
    }

    OverlayState? overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(builder: (context) {
      final keyboardHeight =
          PersistentKeyboardHeight.of(context).keyboardHeight;

      return Positioned(
        // bottom: MediaQuery.of(context).viewInsets.bottom,
        bottom: keyboardHeight -
            60, // хз почему то 60 пиксель пайда болад, наверное персистент нав бардын замажкасы
        right: 0.0,
        left: 0.0,
        child: AppInputDoneView(
          onTap: onTap,
        ),
      );
    });

    overlayState.insert(_overlayEntry!);
  }

  static removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}
