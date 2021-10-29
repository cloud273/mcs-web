import 'package:clinic/model/enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  Profile({
    required this.firstname,
    required this.lastname,
    required this.dob,
    required this.gender,
  });

  String firstname;

  String lastname;

  DateTime dob;

  Gender gender;

  String get fullName => '$lastname $firstname'.trim();

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
