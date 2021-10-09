import 'package:clinic/util/localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClinicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clinic'.localized),
      ),
      body: Container(),
    );
  }
}
