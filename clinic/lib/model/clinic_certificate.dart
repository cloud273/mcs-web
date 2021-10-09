import 'package:clinic/model/certificate.dart';
import 'package:clinic/model/enum.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'clinic_certificate.g.dart';

@JsonSerializable()
class ClinicCertificate extends _ClinicCertificate {
  ClinicCertificate({
    required String code,
    required String name,
    required String issuer,
    required DateTime issueDate,
    DateTime? expDate,
    String? imageName,
    required ClinicCertType type,
  }) : super() {
    this.code = code;
    this.name = name;
    this.issuer = issuer;
    this.issueDate = issueDate;
    this.expDate = expDate;
    this.imageName = imageName;
    this.type = type;
  }

  factory ClinicCertificate.fromJson(Map<String, dynamic> json) =>
      _$ClinicCertificateFromJson(json);

  Map<String, dynamic> toJson() => _$ClinicCertificateToJson(this);
}

class _ClinicCertificate = ClinicCertificateBase with _$ClinicCertificate;

abstract class ClinicCertificateBase extends CertificateBase with Store {
  @observable
  ClinicCertType type = ClinicCertType.other;
}
