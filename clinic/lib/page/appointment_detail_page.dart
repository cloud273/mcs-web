import 'package:clinic/model/appointment.dart';
import 'package:clinic/util/localization.dart';
import 'package:clinic/util/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AppointmentDetailPage extends StatelessWidget {
  AppointmentDetailPage(this._appointment) : super();

  final Appointment _appointment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.subtitle1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment detail'.localized),
      ),
      body: InkWell(
        child: Observer(
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(16),
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _appointment.specialtyCode,
                    style: style,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    Utility.convertDateTime(date: _appointment.begin),
                    style: style,
                  ),
                ],
              ),
            );
          },
        ),
        onTap: () {
          _appointment.begin = DateTime.now();
        },
      ),
    );
  }
}
