import 'package:json_annotation/json_annotation.dart';

part 'surgery.g.dart';

@JsonSerializable()
class Surgery {
  Surgery({
    required this.name,
    required this.date,
    this.description,
  });

  String name;

  DateTime date;

  String? description;

  factory Surgery.fromJson(Map<String, dynamic> json) =>
      _$SurgeryFromJson(json);

  Map<String, dynamic> toJson() => _$SurgeryToJson(this);
}
