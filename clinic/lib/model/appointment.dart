import 'package:clinic/model/allergy.dart';
import 'package:clinic/model/apt_clinic_info.dart';
import 'package:clinic/model/apt_status.dart';
import 'package:clinic/model/doctor.dart';
import 'package:clinic/model/enum.dart';
import 'package:clinic/model/patient.dart';
import 'package:clinic/model/specialty.dart';
import 'package:clinic/model/surgery.dart';
import 'package:clinic/model/symptom.dart';
import 'package:clinic/storage/other_storage.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'appointment.g.dart';

@JsonSerializable()
class Appointment extends _Appointment {
  Appointment({
    required this.code,
    required this.order,
    required this.begin,
    required this.specialtyCode,
    required this.type,
    required this.visitTime,
    required AptStatus status,
    required this.doctor,
    required this.patient,
    required this.clinic,
    this.symptoms,
    this.allergies,
    this.surgeries,
  }) : super() {
    this.status = status;
  }

  String code;

  int order;

  DateTime begin;

  @JsonKey(name: 'specialty')
  String specialtyCode;

  PackageType type;

  int visitTime;

  @JsonKey(name: 'doctorInfo')
  Doctor doctor;

  @JsonKey(name: 'patientInfo')
  Patient patient;

  @JsonKey(name: 'clinicInfo')
  AptClinicInfo clinic;

  List<Symptom>? symptoms;

  List<Allergy>? allergies;

  List<Surgery>? surgeries;

  Specialty get specialty => OtherStorage.instance.specialty(specialtyCode);

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}

class _Appointment = AppointmentBase with _$Appointment;

abstract class AppointmentBase with Store {
  @observable
  AptStatus? status;
}
