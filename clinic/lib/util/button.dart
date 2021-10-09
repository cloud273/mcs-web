import 'package:flutter/material.dart';

class Button {
  static ElevatedButton create({
    required String text,
    required VoidCallback onPressed,
    required Color textColor,
    required Color color,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    double radius = 0,
    double? borderWidth,
    Color? borderColor,
    EdgeInsets? padding = const EdgeInsets.fromLTRB(12, 12, 12, 12),
  }) {
    RoundedRectangleBorder? shape;
    BorderSide borderSide;
    BorderRadius borderRadius;
    if (radius != 0) {
      borderRadius = BorderRadius.circular(radius);
    } else {
      borderRadius = BorderRadius.zero;
    }
    if (borderWidth != null && borderWidth > 0) {
      borderSide = BorderSide(
        color: borderColor ?? const Color(0xFF000000),
        width: borderWidth,
        style: BorderStyle.solid,
      );
    } else {
      borderSide = BorderSide.none;
    }
    if (borderSide != BorderSide.none || borderRadius != BorderRadius.zero) {
      shape = RoundedRectangleBorder(
        side: borderSide,
        borderRadius: borderRadius,
      );
    }
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding,
        textStyle: TextStyle(
          color: textColor,
          backgroundColor: color,
        ),
        shape: shape,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }

  static ElevatedButton border({
    required String text,
    required Color textColor,
    required Color color,
    required VoidCallback onPressed,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return create(
      text: text,
      textColor: textColor,
      color: color,
      onPressed: onPressed,
      fontSize: fontSize,
      fontWeight: fontWeight,
      radius: 5,
    );
  }

  static ElevatedButton transparentBorder({
    required String text,
    required Color textColor,
    required VoidCallback onPressed,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return create(
      text: text,
      onPressed: onPressed,
      textColor: textColor,
      color: Colors.transparent,
      fontSize: fontSize,
      fontWeight: fontWeight,
      radius: 5,
      borderWidth: 1,
      borderColor: textColor,
    );
  }

  static ElevatedButton submit({
    required String text,
    required VoidCallback onPressed,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }

  static ElevatedButton cancel({
    required String text,
    required VoidCallback onPressed,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return border(
      text: text,
      onPressed: onPressed,
      textColor: Colors.white,
      color: Colors.red,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static ElevatedButton transparent({
    required String text,
    required VoidCallback onPressed,
    EdgeInsets? padding,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return create(
      padding: padding,
      text: text,
      onPressed: onPressed,
      textColor: Colors.blue,
      color: Colors.transparent,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static GestureDetector addGesture({
    required Widget widget,
    required int count,
    required VoidCallback onPressed,
  }) {
    int lastTap = 0;
    int consecutiveTaps = 0;
    return GestureDetector(
      onTap: () {
        int now = DateTime.now().millisecondsSinceEpoch;
        if (now - lastTap < 1000) {
          consecutiveTaps++;
          if (consecutiveTaps >= count - 1) {
            consecutiveTaps = 0;
            onPressed();
          }
        } else {
          consecutiveTaps = 0;
        }
        lastTap = now;
      },
      child: widget,
    );
  }
}
