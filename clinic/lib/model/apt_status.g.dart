// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apt_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AptStatus _$AptStatusFromJson(Map<String, dynamic> json) => AptStatus(
      by: $enumDecode(_$UserTypeEnumMap, json['by']),
      value: $enumDecode(_$AptStatusTypeEnumMap, json['value']),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$AptStatusToJson(AptStatus instance) => <String, dynamic>{
      'by': _$UserTypeEnumMap[instance.by],
      'value': _$AptStatusTypeEnumMap[instance.value],
      'note': instance.note,
    };

const _$UserTypeEnumMap = {
  UserType.patient: 'patient',
  UserType.clinic: 'clinic',
  UserType.doctor: 'doctor',
  UserType.system: 'system',
};

const _$AptStatusTypeEnumMap = {
  AptStatusType.created: 'created',
  AptStatusType.accepted: 'accepted',
  AptStatusType.started: 'started',
  AptStatusType.rejected: 'rejected',
  AptStatusType.cancelled: 'cancelled',
  AptStatusType.finished: 'finished',
};
