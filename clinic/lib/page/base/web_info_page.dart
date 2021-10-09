import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

class WebInfoPage extends StatelessWidget {
  String get title => "";

  String get url => "";

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebViewX(
        initialContent: 'Loading',
        initialSourceType: SourceType.html,
        height: screenSize.height / 2,
        width: min(screenSize.width * 0.8, 1024),
        onWebViewCreated: (controller) {
          controller.loadContent(
            url,
            SourceType.url,
          );
        },
      ),
    );
  }
}
