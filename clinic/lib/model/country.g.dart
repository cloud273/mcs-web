// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    code: json['code'] as String,
    nameMap: Map<String, String>.from(json['name'] as Map),
    states: (json['state'] as List<dynamic>)
        .map((e) => State.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.nameMap,
      'state': instance.states,
    };
