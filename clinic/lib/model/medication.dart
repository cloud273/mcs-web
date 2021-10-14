import 'package:clinic/model/enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medication.g.dart';

@JsonSerializable()
class Medication {
  Medication({
    required this.name,
    required this.value,
    this.note,
  });

  String name;

  Trilean value;

  String? note;

  factory Medication.fromJson(Map<String, dynamic> json) =>
      _$MedicationFromJson(json);

  Map<String, dynamic> toJson() => _$MedicationToJson(this);
}
