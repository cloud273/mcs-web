import 'package:clinic/model/appointment.dart';
import 'package:clinic/model/apt_status.dart';
import 'package:clinic/model/enum.dart';
import 'package:clinic/storage/other_storage.dart';
import 'package:clinic/util/button.dart';
import 'package:clinic/util/localization.dart';
import 'package:clinic/util/converter.dart';
import 'package:clinic/view/header_widget.dart';
import 'package:clinic/view/title_label_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AppointmentDetailPage extends StatelessWidget {
  AppointmentDetailPage(
    this._appointment, {
    this.onStatusChanged,
  }) : super();

  final Appointment _appointment;
  final Function(AptStatus status)? onStatusChanged;

  @override
  Widget build(BuildContext context) {
    final offset = SizedBox(height: 12);
    final sessionOffset = SizedBox(height: 30);
    final today = DateTime.now();
    final isCreated = _appointment.status.value == AptStatusType.created;
    final acceptableEnd = _appointment.begin
        .add(Duration(seconds: OtherStorage.instance.acceptableEnd));
    final acceptable = isCreated && today.compareTo(acceptableEnd) < 0;
    final rejectableEnd = _appointment.begin
        .add(Duration(seconds: OtherStorage.instance.rejectableEnd));
    final rejectable = isCreated && today.compareTo(rejectableEnd) < 0;
    return Observer(
      builder: (context) {
        return Container(
          width: 800,
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(title: 'Patient_Info'.localized),
                offset,
                TitleLabelWidget(
                  title: 'Fullname'.localized,
                  text: _appointment.patient.profile.fullName,
                ),
                offset,
                TitleLabelWidget(
                  title: 'Dob'.localized,
                  text: Converter.dateTimeToDateString(
                    date: _appointment.patient.profile.dob,
                  ),
                ),
                offset,
                TitleLabelWidget(
                  title: 'Gender'.localized,
                  text: _appointment.patient.profile.gender.text,
                ),
                sessionOffset,
                HeaderWidget(title: 'Doctor_Info'.localized),
                offset,
                TitleLabelWidget(
                  title: 'Fullname'.localized,
                  text: _appointment.doctor.profile.fullName,
                ),
                offset,
                TitleLabelWidget(
                  title: 'Dob'.localized,
                  text: Converter.dateTimeToDateString(
                    date: _appointment.doctor.profile.dob,
                  ),
                ),
                sessionOffset,
                HeaderWidget(title: 'Appointment_Info'.localized),
                offset,
                TitleLabelWidget(
                    title: 'Specialty'.localized,
                    text: _appointment.specialty.name),
                offset,
                TitleLabelWidget(
                  title: 'Time'.localized,
                  text: Converter.dateTimeToDateTimeString(date: _appointment.begin),
                ),
                offset,
                TitleLabelWidget(
                  title: 'Price'.localized,
                  text: _appointment.price!.amount.toString(),
                ),
                offset,
                TitleLabelWidget(
                  title: 'Order'.localized,
                  text: _appointment.order.toString(),
                ),
                offset,
                TitleLabelWidget(
                  title: 'Status'.localized,
                  text: _appointment.status.value.text,
                ),
                if (_appointment.symptoms!.isNotEmpty) ...[
                  offset,
                  TitleLabelWidget(
                    title: 'Symptom'.localized,
                    text: _appointment.symptoms!.text,
                  ),
                ],
                if (_appointment.allergies != null &&
                    _appointment.allergies!.isNotEmpty) ...[
                  offset,
                  TitleLabelWidget(
                    title: 'Allergy'.localized,
                    text: _appointment.allergies!.text,
                  ),
                ],
                if (_appointment.surgeries != null &&
                    _appointment.surgeries!.isNotEmpty) ...[
                  offset,
                  TitleLabelWidget(
                    title: 'Surgery'.localized,
                    text: _appointment.surgeries!.text,
                  ),
                ],
                SizedBox(height: 40),
                if (acceptable || rejectable)
                  Row(
                    children: [
                      if (acceptable)
                        Expanded(
                          child: Button.create(
                            text: "Accept".localized,
                            color: Colors.green,
                            onPressed: () {
                              final status = AptStatus(
                                by: UserType.clinic,
                                value: AptStatusType.accepted,
                              );
                              _appointment.status = status;
                              if (onStatusChanged != null) {
                                onStatusChanged!(status);
                              }
                            },
                          ),
                        ),
                      if (acceptable && rejectable)
                        SizedBox(
                          width: 10,
                        ),
                      if (rejectable)
                        Expanded(
                          child: Button.create(
                            text: "Reject".localized,
                            color: Colors.red,
                            onPressed: () {
                              final status = AptStatus(
                                by: UserType.clinic,
                                value: AptStatusType.rejected,
                              );
                              _appointment.status = status;
                              if (onStatusChanged != null) {
                                onStatusChanged!(status);
                              }
                            },
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
