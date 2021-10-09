import 'dart:math';

import 'package:clinic/api/clinic/clinic_list_appointment_api.dart';
import 'package:clinic/model/appointment.dart';
import 'package:clinic/storage/other_storage.dart';
import 'package:clinic/storage/user_storage.dart';
import 'package:clinic/util/localization.dart';
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
    var size = MediaQuery.of(context).size;
    final double itemHeight = 200.0;
    final double itemWidth = 500.0;
    double offset = 20.0;
    final crossAxisCount =
        max((size.width - offset) ~/ (itemWidth + offset), 1);
    offset = max(
        (size.width - itemWidth * crossAxisCount) / (crossAxisCount + 1), 0);
    return Scaffold(
      appBar: AppBar(
        title: Text('List_active_appointment'.localized),
      ),
      body: GridView.builder(
        clipBehavior: Clip.none,
        shrinkWrap: true,
        padding: EdgeInsets.all(offset),
        controller: ScrollController(keepScrollOffset: true),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: itemWidth / itemHeight,
          mainAxisSpacing: offset,
          crossAxisSpacing: offset,
        ),
        itemCount: listAppointment.length,
        itemBuilder: (context, index) {
          final appointment = listAppointment[index];
          return AppointmentCell(appointment: appointment);
        },
      ),
    );
  }
}
