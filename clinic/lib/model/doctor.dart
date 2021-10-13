import 'package:clinic/constant.dart';
import 'package:clinic/model/profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doctor.g.dart';

@JsonSerializable()
class Doctor {
  Doctor({
    required this.imageName,
    required this.title,
    required this.profile,
  });

  @JsonKey(name: 'image')
  String imageName;

  String title;

  Profile profile;

  String get image => '$ImageUrl/$imageName';

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}
