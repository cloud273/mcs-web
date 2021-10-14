import 'package:json_annotation/json_annotation.dart';

export 'extension.dart';

enum AccountType {
  admin,
  clinic,
  doctor,
  patient,
}

enum AptStatusType {
  created,
  accepted,
  started,
  rejected,
  cancelled,
  finished,
}

enum ClinicCertType {
  working,
  other,
}

enum DeviceOS {
  ios,
  android,
  window,
  mac,
  linux,
  chrome,
  safari,
  firefox,
  ie,
  edge,
  unsupported,
}

enum DoctorCertType {
  personal,
  working,
  degree,
  other,
}

enum Gender {
  male,
  female,
}

enum Language {
  @JsonValue('vi')
  vietnamese,
  @JsonValue('en')
  english,
}

enum NotifyType {
  email,
  sms,
}

enum PackageType {
  classic,
  telemed,
}

enum UserType {
  patient,
  clinic,
  doctor,
  system,
}

enum Currency {
  vnd,
  usd,
}

enum MedicationType {
  highBP,
  highCholesterol,
  pregnant,
  cancer,
}

enum Trilean {
  yes,
  no,
  unknown,
}
