import 'dart:math';

import 'package:clinic/api/clinic/clinic_list_appointment_api.dart';
import 'package:clinic/model/app_state.dart';
import 'package:clinic/model/appointment.dart';
import 'package:clinic/model/extension.dart';
import 'package:clinic/storage/other_storage.dart';
import 'package:clinic/storage/user_storage.dart';
import 'package:clinic/view/appointment_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListAppointmentPage extends StatefulWidget {
  @override
  _ListAppointmentPageState createState() => _ListAppointmentPageState();
}

class _ListAppointmentPageState extends State<ListAppointmentPage> {
  List<Appointment> listAppointment = [];

  void _loadInformation(String token) async {
    try {
      final today = DateTime.now();
      final from = today.add(
        Duration(
          seconds: min(
            min(
              OtherStorage.instance.acceptableEnd,
              OtherStorage.instance.rejectableEnd,
            ),
            OtherStorage.instance.beginableFrom,
          ),
        ),
      );
      final to = today.add(Duration(days: 30));
      final appointments = await ClinicListAppointmentApi(
        token: token,
        type: null,
        statusTypes: null,
        from: from,
        to: to,
      ).run();
      setState(() {
        appointments.sort((a, b) {
          return a.begin.compareTo(b.begin);
        });
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
    // print(DateTime.parse("2021-10-12T06:00:00+00:00"));
    return Scaffold(
      appBar: AppBar(
        title: Text(AppMainPage.activeAppointment.name),
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
            return AppointmentCell(
              appointment: appointment,
              color: color,
            );
          },
        ),
      ),
    );
  }
}
