// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patient _$PatientFromJson(Map<String, dynamic> json) => Patient(
      id: json['id'] as int?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      imageName: json['image'] as String?,
      profile: Profile.fromJson(json['profile'] as Map<String, dynamic>),
      language: $enumDecodeNullable(_$LanguageEnumMap, json['language']),
      username: json['username'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'image': instance.imageName,
      'profile': instance.profile,
      'language': _$LanguageEnumMap[instance.language],
      'username': instance.username,
      'description': instance.description,
    };

const _$LanguageEnumMap = {
  Language.vietnamese: 'vi',
  Language.english: 'en',
};
