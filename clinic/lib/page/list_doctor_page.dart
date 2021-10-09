import 'package:clinic/util/localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListDoctorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor'.localized),
      ),
      body: Container(),
    );
  }
}
