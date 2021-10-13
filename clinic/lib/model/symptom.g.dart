// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Symptom _$SymptomFromJson(Map<String, dynamic> json) {
  return Symptom(
    name: json['name'] as String,
    note: json['note'] as String,
  );
}

Map<String, dynamic> _$SymptomToJson(Symptom instance) => <String, dynamic>{
      'name': instance.name,
      'note': instance.note,
    };
