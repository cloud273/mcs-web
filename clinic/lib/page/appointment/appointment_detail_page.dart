import 'package:clinic/model/appointment.dart';
import 'package:clinic/model/enum.dart';
import 'package:clinic/util/button.dart';
import 'package:clinic/util/localization.dart';
import 'package:clinic/util/utility.dart';
import 'package:clinic/view/header_widget.dart';
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
    final sessionOffset = SizedBox(height: 30);
    return Observer(
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
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
                text: Utility.convertIso8601DateTimeString(
                  dateString: _appointment.patient.profile.dob,
                )!,
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
                text: Utility.convertIso8601DateTimeString(
                  dateString: _appointment.doctor.profile.dob,
                )!,
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
                text: Utility.convertDateTime(date: _appointment.begin),
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
              Row(
                children: [
                  Expanded(
                    child: Button.create(
                      text: "Accept".localized,
                      color: Colors.green,
                      onPressed: () {
                        print('Accept');
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Button.create(
                      text: "Reject".localized,
                      color: Colors.red,
                      onPressed: () {
                        print('Reject');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
