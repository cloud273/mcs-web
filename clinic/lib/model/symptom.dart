import 'package:json_annotation/json_annotation.dart';

part 'symptom.g.dart';

@JsonSerializable()
class Symptom {
  Symptom({
    required this.name,
    required this.note,
  });

  String name;

  String note;

  factory Symptom.fromJson(Map<String, dynamic> json) =>
      _$SymptomFromJson(json);

  Map<String, dynamic> toJson() => _$SymptomToJson(this);
}
