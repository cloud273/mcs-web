import 'package:clinic/model/appointment.dart';
import 'package:clinic/page/appointment_detail_page.dart';
import 'package:clinic/util/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AppointmentCell extends StatelessWidget {
  AppointmentCell({required this.appointment}) : super();

  final Appointment appointment;

  @protected
  void onTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AppointmentDetailPage(appointment),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.subtitle1;
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(16),
        color: Colors.blue,
        child: Observer(
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appointment.specialtyCode,
                  style: style,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  Utility.convertDateTime(date: appointment.begin),
                  style: style,
                ),
              ],
            );
          },
        ),
      ),
      onTap: () {
        onTap(context);
      },
    );
  }
}
