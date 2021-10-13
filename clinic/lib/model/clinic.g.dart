// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Clinic _$ClinicFromJson(Map<String, dynamic> json) {
  return Clinic(
    name: json['name'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
    address: Address.fromJson(json['address'] as Map<String, dynamic>),
    imageName: json['image'] as String,
    workPhone: json['workPhone'] as String?,
    certificates: (json['certificates'] as List<dynamic>?)
        ?.map((e) => ClinicCertificate.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ClinicToJson(Clinic instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'workPhone': instance.workPhone,
      'address': instance.address,
      'certificates': instance.certificates,
      'image': instance.imageName,
    };
