// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialty.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Specialty _$SpecialtyFromJson(Map<String, dynamic> json) => Specialty(
      code: json['code'] as String,
      nameMap: Map<String, String>.from(json['name'] as Map),
      imageName: json['image'] as String,
    );

Map<String, dynamic> _$SpecialtyToJson(Specialty instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.nameMap,
      'image': instance.imageName,
    };
