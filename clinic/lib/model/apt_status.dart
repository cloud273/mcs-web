import 'package:clinic/model/enum.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'apt_status.g.dart';

@JsonSerializable()
class AptStatus extends _AptStatus {
  AptStatus({
    required UserType by,
    required AptStatusType value,
    String? note,
  }) : super() {
    this.by = by;
    this.value = value;
    this.note = note;
  }

  factory AptStatus.fromJson(Map<String, dynamic> json) =>
      _$AptStatusFromJson(json);

  Map<String, dynamic> toJson() => _$AptStatusToJson(this);
}

class _AptStatus = AptStatusBase with _$AptStatus;

abstract class AptStatusBase with Store {
  UserType by = UserType.patient;

  AptStatusType value = AptStatusType.finished;

  String? note = '';
}
