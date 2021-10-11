import 'package:clinic/api/clinic/clinic_list_appointment_api.dart';
import 'package:clinic/model/app_state.dart';
import 'package:clinic/model/appointment.dart';
import 'package:clinic/model/extension.dart';
import 'package:clinic/storage/user_storage.dart';
import 'package:clinic/view/history_appointment_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListHistoryAppointmentPage extends StatefulWidget {
  @override
  _ListHistoryAppointmentPageState createState() =>
      _ListHistoryAppointmentPageState();
}

class _ListHistoryAppointmentPageState
    extends State<ListHistoryAppointmentPage> {
  List<Appointment> listAppointment = [];

  void _loadInformation(String token) async {
    try {
      final today = DateTime.now();
      final from = today.subtract(Duration(days: 365));
      final to = today.subtract(Duration(days: 1));
      final appointments = await ClinicListAppointmentApi(
        token: token,
        type: null,
        statusTypes: null,
        from: from,
        to: to,
      ).run();
      setState(() {
        listAppointment = appointments;
      });
    } catch (e) {
      if (e is int && e == 403) {
        UserStorage.instance.logout();
      } else {}
    }
  }

  @override
  void initState() {
    _loadInformation(UserStorage.instance.token!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppMainPage.historyAppointment.name),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: listAppointment.length + 1,
          itemBuilder: (context, index) {
            final appointment = index > 0 ? listAppointment[index - 1] : null;
            final color = appointment == null
                ? Color(0xFFEAEAEA)
                : (index % 2 == 0 ? Color(0xFFF3F3F3) : Color(0xFFFFFFFF));
            return HistoryAppointmentCell(
              appointment: appointment,
              color: color,
            );
          },
        ),
      ),
    );
  }
}
