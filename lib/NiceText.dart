import 'package:flutter/material.dart';

class NiceText extends StatelessWidget {
  final String text;

  NiceText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(shadows: [
        Shadow(
            blurRadius: 5,
            color: Color.fromARGB(155, 0, 0, 255),
            offset: Offset(1, 1))
      ]),
    );
  }
}
