import 'package:clinic/model/certificate.dart';
import 'package:clinic/model/enum.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'doctor_certificate.g.dart';

@JsonSerializable()
class DoctorCertificate extends _DoctorCertificate {
  DoctorCertificate({
    required String code,
    required String name,
    required String issuer,
    required DateTime issueDate,
    DateTime? expDate,
    String? imageName,
    required DoctorCertType type,
  }) : super() {
    this.code = code;
    this.name = name;
    this.issuer = issuer;
    this.issueDate = issueDate;
    this.expDate = expDate;
    this.imageName = imageName;
    this.type = type;
  }

  factory DoctorCertificate.fromJson(Map<String, dynamic> json) =>
      _$DoctorCertificateFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorCertificateToJson(this);
}

class _DoctorCertificate = DoctorCertificateBase with _$DoctorCertificate;

abstract class DoctorCertificateBase extends CertificateBase with Store {
  @observable
  DoctorCertType type = DoctorCertType.other;
}
