import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleContentWidget extends StatelessWidget {
  TitleContentWidget({
    required this.title,
    this.titleWidth = 100,
    required this.content,
    this.color,
  }) : super();

  final String title;
  final Widget content;
  final double titleWidth;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final offset = SizedBox(width: 40);
    final theme = Theme.of(context);
    final style = theme.textTheme.subtitle1;
    return Container(
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: titleWidth,
            child: Text(
              title,
              style: style,
            ),
          ),
          offset,
          content,
        ],
      ),
    );
  }
}
