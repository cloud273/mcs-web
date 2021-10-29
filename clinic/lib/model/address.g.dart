// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      countryCode: json['country'] as String,
      stateCode: json['state'] as String,
      cityCode: json['city'] as String,
      line: json['line'] as String,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'country': instance.countryCode,
      'state': instance.stateCode,
      'city': instance.cityCode,
      'line': instance.line,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
