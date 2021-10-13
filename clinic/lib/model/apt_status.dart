import 'package:clinic/model/enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apt_status.g.dart';

@JsonSerializable()
class AptStatus {
  AptStatus({
    required this.by,
    required this.value,
    this.note,
  });

  UserType by;

  AptStatusType value;

  String? note;

  factory AptStatus.fromJson(Map<String, dynamic> json) =>
      _$AptStatusFromJson(json);

  Map<String, dynamic> toJson() => _$AptStatusToJson(this);
}
