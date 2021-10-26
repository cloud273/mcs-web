import 'package:flutter/material.dart';

class Button {
  static ElevatedButton create({
    required String text,
    required VoidCallback onPressed,
    Color? color,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return ElevatedButton(
      style: color != null
          ? ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(color))
          : null,
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
