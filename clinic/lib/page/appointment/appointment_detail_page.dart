import 'package:clinic/model/appointment.dart';
import 'package:clinic/model/enum.dart';
import 'package:clinic/util/localization.dart';
import 'package:clinic/util/utility.dart';
import 'package:clinic/view/title_label_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AppointmentDetailPage extends StatelessWidget {
  AppointmentDetailPage(this._appointment) : super();

  final Appointment _appointment;

  @override
  Widget build(BuildContext context) {
    final offset = SizedBox(height: 12);
    final theme = Theme.of(context);
    final style = theme.textTheme.subtitle1;
    return Observer(
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleLabelWidget(
                  title: 'Specialty'.localized,
                  text: _appointment.specialty.name),
              offset,
              TitleLabelWidget(
                title: 'Time'.localized,
                text: Utility.convertDateTime(date: _appointment.begin),
              ),
              offset,
              TitleLabelWidget(
                title: 'Status'.localized,
                text: _appointment.status.value.text,
              ),
              offset,
              TitleLabelWidget(
                title: 'Order'.localized,
                text: _appointment.order.toString(),
              ),
              offset,
              TitleLabelWidget(
                title: 'Doctor'.localized,
                text: _appointment.doctor.profile.fullName,
              ),
              offset,
              TitleLabelWidget(
                title: 'Patient'.localized,
                text: _appointment.patient.profile.fullName,
              ),
              offset,
              TitleLabelWidget(
                title: 'Price'.localized,
                text: _appointment.price!.amount.toString(),
              ),
            ],
          ),
        );
      },
    );
  }
}
