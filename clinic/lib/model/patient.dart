import 'package:clinic/constant.dart';
import 'package:clinic/model/address.dart';
import 'package:clinic/model/enum.dart';
import 'package:clinic/model/profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patient.g.dart';

@JsonSerializable()
class Patient {
  Patient({
    this.id,
    this.address,
    this.imageName,
    required this.profile,
    this.language,
    this.username,
    this.description,
  });

  int? id;

  Address? address;

  @JsonKey(name: 'image')
  String? imageName;

  Profile profile;

  Language? language;

  String? username;

  String? description;

  String? get image => imageName != null ? '$ImageUrl/$imageName' : null;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);

  Map<String, dynamic> toJson() => _$PatientToJson(this);
}
