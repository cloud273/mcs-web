// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

State _$StateFromJson(Map<String, dynamic> json) {
  return State(
    code: json['code'] as String,
    nameMap: Map<String, String>.from(json['name'] as Map),
    cities: (json['city'] as List<dynamic>)
        .map((e) => City.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$StateToJson(State instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.nameMap,
      'city': instance.cities,
    };
