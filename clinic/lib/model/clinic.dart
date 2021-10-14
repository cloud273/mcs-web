import 'package:clinic/constant.dart';
import 'package:clinic/model/clinic_certificate.dart';
import 'package:json_annotation/json_annotation.dart';

import 'address.dart';

part 'clinic.g.dart';

@JsonSerializable()
class Clinic {
  Clinic({
    this.id,
    required this.name,
    this.email,
    this.phone,
    this.address,
    required this.imageName,
    this.workPhone,
    this.certificates,
    this.description,
  });

  int? id;

  String name;

  String? email;

  String? phone;

  @JsonKey(name: 'workPhone')
  String? workPhone;

  Address? address;

  List<ClinicCertificate>? certificates;

  @JsonKey(name: 'image')
  String imageName;

  String? description;

  String get image => '$ImageUrl/$imageName';

  factory Clinic.fromJson(Map<String, dynamic> json) => _$ClinicFromJson(json);

  Map<String, dynamic> toJson() => _$ClinicToJson(this);
}
