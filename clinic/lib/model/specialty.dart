import 'package:clinic/constant.dart';
import 'package:json_annotation/json_annotation.dart';

part 'specialty.g.dart';

@JsonSerializable()
class Specialty {
  Specialty({
    required this.code,
    required this.nameMap,
    required this.imageName,
  });

  String code;

  @JsonKey(name: 'name')
  Map<String, String> nameMap;

  @JsonKey(name: 'image')
  String imageName;

  String? get image => '$ResourceUrl/$imageName';

  factory Specialty.fromJson(Map<String, dynamic> json) =>
      _$SpecialtyFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialtyToJson(this);
}
