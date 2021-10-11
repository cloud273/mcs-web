import 'package:clinic/model/apt_status.dart';
import 'package:clinic/model/enum.dart';
import 'package:clinic/model/specialty.dart';
import 'package:clinic/storage/other_storage.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'appointment.g.dart';

@JsonSerializable()
class Appointment extends _Appointment {
  Appointment({
    required String code,
    required int order,
    required DateTime begin,
    required String specialtyCode,
    required PackageType type,
    required int visitTime,
    required AptStatus status,
  }) : super() {
    this.code = code;
    this.order = order;
    this.begin = begin;
    this.specialtyCode = specialtyCode;
    this.type = type;
    this.visitTime = visitTime;
    this.status = status;
  }

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}

class _Appointment = AppointmentBase with _$Appointment;

abstract class AppointmentBase with Store {
  String code = '';

  int order = -1;

  DateTime begin = DateTime.now();

  @JsonKey(name: 'specialty')
  String specialtyCode = '';

  PackageType type = PackageType.classic;

  int visitTime = 0;

  @observable
  AptStatus? status;

  Specialty get specialty => OtherStorage.instance.specialty(specialtyCode);
}
