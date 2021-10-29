import 'package:clinic/model/appointment.dart';
import 'package:clinic/model/enum.dart';
import 'package:clinic/util/localization.dart';
import 'package:clinic/util/converter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AppointmentCell extends StatelessWidget {
  AppointmentCell({
    this.appointment,
    this.color,
    this.onTap,
  }) : super();

  final Appointment? appointment;
  final Color? color;
  final Function()? onTap;

  Widget _main(BuildContext context) {
    final offset = SizedBox(width: 40);
    final theme = Theme.of(context);
    final style = theme.textTheme.subtitle1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 80,
          child: Text(
            appointment?.code ?? 'Code'.localized,
            style: style,
          ),
        ),
        offset,
        Container(
          width: 200,
          child: Text(
            appointment?.begin != null
                ? Converter.dateTimeToDateTimeString(date: appointment!.begin)
                : 'Time'.localized,
            style: style,
          ),
        ),
        offset,
        Container(
          width: 50,
          child: Text(
            appointment?.order.toString() ?? 'Order'.localized,
            style: style,
          ),
        ),
        offset,
        Container(
          width: 100,
          child: Text(
            appointment?.specialty.name ?? 'Specialty'.localized,
            style: style,
          ),
        ),
        offset,
        Container(
          width: 120,
          child: Text(
            appointment?.type.text ?? 'Package'.localized,
            style: style,
          ),
        ),
        offset,
        Container(
          width: 175,
          child: Text(
            appointment?.patient.profile.fullName ?? 'Patient'.localized,
            style: style,
          ),
        ),
        offset,
        Container(
          width: 175,
          child: Text(
            appointment?.doctor.profile.fullName ?? 'Doctor'.localized,
            style: style,
          ),
        ),
        offset,
        Container(
          width: 100,
          child: Text(
            appointment?.status.value.text ?? 'Status'.localized,
            style: style,
          ),
        ),
        offset,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (appointment == null) {
      return Container(
        padding: EdgeInsets.all(16),
        color: color,
        child: _main(context),
      );
    } else {
      return InkWell(
        child: Container(
          padding: EdgeInsets.all(16),
          color: color,
          child: Observer(
            builder: (context) {
              return _main(context);
            },
          ),
        ),
        onTap: onTap,
      );
    }
  }
}
