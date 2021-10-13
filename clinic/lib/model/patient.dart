import 'package:clinic/constant.dart';
import 'package:clinic/model/profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patient.g.dart';

@JsonSerializable()
class Patient {
  Patient({
    this.imageName,
    required this.profile,
  });

  @JsonKey(name: 'image')
  String? imageName;

  Profile profile;

  String? get image => imageName != null ? '$ImageUrl/$imageName' : null;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);

  Map<String, dynamic> toJson() => _$PatientToJson(this);
}
