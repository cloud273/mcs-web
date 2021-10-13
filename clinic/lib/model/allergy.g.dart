// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allergy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Allergy _$AllergyFromJson(Map<String, dynamic> json) {
  return Allergy(
    name: json['name'] as String,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$AllergyToJson(Allergy instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };
