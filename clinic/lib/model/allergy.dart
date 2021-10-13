import 'package:json_annotation/json_annotation.dart';

part 'allergy.g.dart';

@JsonSerializable()
class Allergy {
  Allergy({
    required this.name,
    this.description,
  });

  String name;

  String? description;

  factory Allergy.fromJson(Map<String, dynamic> json) =>
      _$AllergyFromJson(json);

  Map<String, dynamic> toJson() => _$AllergyToJson(this);
}
