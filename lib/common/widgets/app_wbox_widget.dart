import 'package:flutter/material.dart';

class WBox extends StatelessWidget {
  const WBox({Key? key, this.width = 12}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
