import 'package:flutter/material.dart';

class TextWithFont {
  Text textShow(
      {required String text,
      required double fontSize,
      required FontWeight fontWeight,
      Color? color,
      TextAlign? textAlign}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}
