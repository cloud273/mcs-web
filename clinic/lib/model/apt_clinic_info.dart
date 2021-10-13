import 'package:clinic/constant.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apt_clinic_info.g.dart';

@JsonSerializable()
class AptClinicInfo {
  AptClinicInfo({
    required this.name,
    required this.imageName,
  });

  String name;

  @JsonKey(name: 'image')
  String imageName;

  String get image => '$ImageUrl/$imageName';

  factory AptClinicInfo.fromJson(Map<String, dynamic> json) =>
      _$AptClinicInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AptClinicInfoToJson(this);
}
