import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget({
    required this.title,
    this.alignment = MainAxisAlignment.start,
  }) : super();

  final String title;
  final MainAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      color: Colors.lightBlue,
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          Text(
            title,
            style: theme.textTheme.headline6!.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
