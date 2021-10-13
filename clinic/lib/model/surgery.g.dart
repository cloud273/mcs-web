// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surgery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Surgery _$SurgeryFromJson(Map<String, dynamic> json) {
  return Surgery(
    name: json['name'] as String,
    date: DateTime.parse(json['date'] as String),
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$SurgeryToJson(Surgery instance) => <String, dynamic>{
      'name': instance.name,
      'date': instance.date.toIso8601String(),
      'description': instance.description,
    };
