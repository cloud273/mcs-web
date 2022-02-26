import 'dart:math';

import 'package:clinic/api/clinic/clinic_appointment_detail_api.dart';
import 'package:clinic/api/clinic/clinic_list_appointment_api.dart';
import 'package:clinic/model/app_state.dart';
import 'package:clinic/model/appointment.dart';
import 'package:clinic/model/extension.dart';
import 'package:clinic/page/detail/appointment_detail_page.dart';
import 'package:clinic/storage/other_storage.dart';
import 'package:clinic/storage/user_storage.dart';
import 'package:clinic/util/alert.dart';
import 'package:clinic/view/appointment_cell.dart';
import 'package:flutter/material.dart';

class ListAppointmentPage extends StatefulWidget {
  const ListAppointmentPage({Key? key}) : super(key: key);

  @override
  _ListAppointmentPageState createState() => _ListAppointmentPageState();
}

class _ListAppointmentPageState extends State<ListAppointmentPage> {
  final _scrollController = ScrollController();
  List<Appointment> listAppointment = [];
  void _loadList() async {
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
      final to = today.add(const Duration(days: 30));
      final appointments = await ClinicListAppointmentApi(
        token: UserStorage.instance.token!,
        type: null,
        statusTypes: null,
        from: from,
        to: to,
      ).run();
      appointments.sort((a, b) {
        return a.begin.compareTo(b.begin);
      });
      setState(() {
        listAppointment = appointments;
      });
    } catch (e) {
      if (e is int && e == 403) {
        UserStorage.instance.logout();
      } else {}
    }
  }

  void _loadDetail(BuildContext context, int id) async {
    try {
      final appointment = await ClinicAppointmentDetailApi(
        token: UserStorage.instance.token!,
        id: id,
      ).run();
      showDialog(
        context: context,
        builder: (context) {
          return AppointmentDetailPage(
            appointment,
            onStatusChanged: (status) {
              try {
                listAppointment
                    .firstWhere((element) => element.id == appointment.id)
                    .status = status;
              } catch (e) {
                print('Appointment list have been updated.');
              }
            },
          );
        },
      );
    } catch (e) {
      if (e == 403) {
        UserStorage.instance.logout();
      } else {
        HttpAlert.showError(context, e);
      }
    }
  }

  @override
  void initState() {
    _loadList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppMainPage.activeAppointment.text),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView.builder(
          controller: _scrollController,
          itemCount: listAppointment.length + 1,
          itemBuilder: (context, index) {
            final appointment = index > 0 ? listAppointment[index - 1] : null;
            final color = appointment == null
                ? const Color(0xFFEAEAEA)
                : (index % 2 == 0
                    ? const Color(0xFFF3F3F3)
                    : const Color(0xFFFFFFFF));
            return AppointmentCell(
              appointment: appointment,
              color: color,
              onTap: () {
                if (appointment != null) {
                  _loadDetail(context, appointment.id);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
