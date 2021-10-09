import 'package:clinic/model/enum.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'appointment.g.dart';

@JsonSerializable()
class Appointment extends _Appointment {
  Appointment({
    required DateTime begin,
    required String specialtyCode,
    required PackageType type,
    required int visitTime,
  }) : super() {
    this.begin = begin;
    this.specialtyCode = specialtyCode;
    this.type = type;
    this.visitTime = visitTime;
  }

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}

class _Appointment = AppointmentBase with _$Appointment;

abstract class AppointmentBase with Store {
  @observable
  DateTime begin = DateTime.now();

  @JsonKey(name: 'specialty')
  @observable
  String specialtyCode = '';

  @observable
  PackageType type = PackageType.classic;

  @observable
  int visitTime = 0;
}
