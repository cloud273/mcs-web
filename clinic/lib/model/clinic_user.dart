import 'package:json_annotation/json_annotation.dart';

part 'clinic_user.g.dart';

@JsonSerializable()
class ClinicUser {
  ClinicUser({
    required this.username,
    this.description,
  });

  String username;

  String? description;

  factory ClinicUser.fromJson(Map<String, dynamic> json) =>
      _$ClinicUserFromJson(json);

  Map<String, dynamic> toJson() => _$ClinicUserToJson(this);
}
