import 'package:clinic/constant.dart';
import 'package:clinic/model/clinic_certificate.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

import 'address.dart';

part 'clinic.g.dart';

@JsonSerializable()
class Clinic extends _Clinic {
  Clinic({
    required String name,
    required String email,
    required String phone,
    String? workPhone,
    required Address address,
    List<ClinicCertificate>? certificates,
    String? imageName,
  }) : super() {
    this.name = name;
    this.email = email;
    this.phone = phone;
    this.workPhone = workPhone;
    this.address = address;
    this.certificates = certificates;
    this.imageName = imageName;
  }

  factory Clinic.fromJson(Map<String, dynamic> json) => _$ClinicFromJson(json);

  Map<String, dynamic> toJson() => _$ClinicToJson(this);
}

class _Clinic = ClinicBase with _$Clinic;

abstract class ClinicBase with Store {
  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String phone = '';

  @observable
  @JsonKey(name: 'workPhone')
  String? workPhone;

  @observable
  Address address = Address(
    countryCode: '',
    stateCode: '',
    cityCode: '',
    line: '',
  );

  @observable
  List<ClinicCertificate>? certificates;

  @JsonKey(name: 'image')
  @observable
  String? imageName;

  @computed
  String? get image => imageName != null ? '$ImageUrl/$imageName' : null;
}
