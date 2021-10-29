// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medication _$MedicationFromJson(Map<String, dynamic> json) => Medication(
      name: json['name'] as String,
      value: $enumDecode(_$TrileanEnumMap, json['value']),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$MedicationToJson(Medication instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': _$TrileanEnumMap[instance.value],
      'note': instance.note,
    };

const _$TrileanEnumMap = {
  Trilean.yes: 'yes',
  Trilean.no: 'no',
  Trilean.unknown: 'unknown',
};
