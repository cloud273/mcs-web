import 'package:flutter/material.dart';

class Label {
  static Text create({
    required String text,
    required Color color,
    required double fontSize,
    required FontWeight fontWeight,
    TextAlign textAlign = TextAlign.left,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
    );
  }

  static Text title({
    required String text,
    Color color = Colors.black,
    TextAlign textAlign = TextAlign.center,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return create(
      text: text,
      color: color,
      fontSize: 19,
      textAlign: textAlign,
      fontWeight: FontWeight.bold,
      decoration: decoration,
    );
  }

  static Text body({
    required String text,
    color: Colors.black,
    TextAlign textAlign = TextAlign.center,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return create(
      text: text,
      color: color,
      textAlign: textAlign,
      fontSize: 15,
      fontWeight: FontWeight.normal,
      decoration: decoration,
    );
  }
}
