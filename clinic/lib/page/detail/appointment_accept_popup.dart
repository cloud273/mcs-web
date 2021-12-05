import 'package:clinic/api/clinic/clinic_appointment_accept_api.dart';
import 'package:clinic/model/appointment.dart';
import 'package:clinic/model/apt_status.dart';
import 'package:clinic/model/enum.dart';
import 'package:clinic/storage/user_storage.dart';
import 'package:clinic/util/alert.dart';
import 'package:clinic/util/button.dart';
import 'package:clinic/util/localization.dart';
import 'package:clinic/util/validator.dart';
import 'package:clinic/view/header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppointmentAcceptPopup extends StatefulWidget {
  AppointmentAcceptPopup(
    this._appointment, {
    this.onFinish,
  }) : super();

  final Appointment _appointment;
  final Function()? onFinish;

  @override
  AppointmentAcceptPopupState createState() => AppointmentAcceptPopupState();
}

class AppointmentAcceptPopupState extends State<AppointmentAcceptPopup> {
  final _formKey = GlobalKey<FormState>();

  late String? _note;

  bool _validateInputs() {
    bool result = _formKey.currentState!.validate();
    if (result) {
      _formKey.currentState!.save();
    }
    return result;
  }

  void _submit(BuildContext context) async {
    try {
      await ClinicAppointmentAcceptApi(
        token: UserStorage.instance.token!,
        id: widget._appointment.id,
        note: _note!,
      ).run();
      final status = AptStatus(
        by: UserType.clinic,
        value: AptStatusType.accepted,
        note: _note,
      );
      widget._appointment.status = status;
      if (widget.onFinish != null) {
        widget.onFinish!();
      }
    } catch (e) {
      if (e == 403) {
        UserStorage.instance.logout();
      } else if (e == 406) {
        Alert.show(context,
            message: 'No_acceptable_appointment_message'.localized);
      } else {
        HttpAlert.showError(context, e);
      }
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: HeaderWidget(title: 'Accept_appointment_confirm'.localized),
      content: Container(
        width: 500,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                keyboardAppearance: Brightness.light,
                decoration: InputDecoration(
                    icon: Icon(Icons.event_note_outlined),
                    labelText: "Note".localized),
                validator: (value) {
                  return Validator.length(
                    value,
                    minLength: 2,
                    maxLength: 128,
                  );
                },
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                onSaved: (value) => _note = value,
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: Button.create(
                      text: "Agree".localized,
                      color: Colors.green,
                      onPressed: () {
                        if (_validateInputs()) {
                          _submit(context);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Button.create(
                      text: "Cancel".localized,
                      color: Colors.red,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
