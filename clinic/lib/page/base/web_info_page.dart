import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WebInfoPage extends StatelessWidget {
  String get title => "";

  String get url => "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: Text(url),
      ),
    );
  }
}
