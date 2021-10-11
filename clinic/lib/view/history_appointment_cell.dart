import 'package:clinic/model/appointment.dart';
import 'package:clinic/page/history/history_appointment_detail_page.dart';
import 'package:clinic/view/appointment_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryAppointmentCell extends AppointmentCell {
  HistoryAppointmentCell({
    Appointment? appointment,
    Color? color,
  }) : super(
          appointment: appointment,
          color: color,
        );

  @override
  void onTap(BuildContext context) {
    if (appointment != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HistoryAppointmentDetailPage(appointment!),
        ),
      );
    }
  }
}
