import 'package:clinic/model/appointment.dart';
import 'package:clinic/page/history_appointment_detail_page.dart';
import 'package:clinic/view/appointment_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryAppointmentCell extends AppointmentCell {
  HistoryAppointmentCell({required Appointment appointment})
      : super(appointment: appointment);
  @override
  void onTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HistoryAppointmentDetailPage(appointment),
      ),
    );
  }
}
