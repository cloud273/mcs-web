// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_certificate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorCertificate _$DoctorCertificateFromJson(Map<String, dynamic> json) =>
    DoctorCertificate(
      code: json['code'] as String,
      name: json['name'] as String,
      issuer: json['issuer'] as String,
      issueDate: DateTime.parse(json['issueDate'] as String),
      expDate: json['expDate'] == null
          ? null
          : DateTime.parse(json['expDate'] as String),
      imageName: json['image'] as String?,
      type: $enumDecode(_$DoctorCertTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$DoctorCertificateToJson(DoctorCertificate instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'issuer': instance.issuer,
      'issueDate': instance.issueDate.toIso8601String(),
      'expDate': instance.expDate?.toIso8601String(),
      'image': instance.imageName,
      'type': _$DoctorCertTypeEnumMap[instance.type],
    };

const _$DoctorCertTypeEnumMap = {
  DoctorCertType.personal: 'personal',
  DoctorCertType.working: 'working',
  DoctorCertType.degree: 'degree',
  DoctorCertType.other: 'other',
};

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DoctorCertificate on DoctorCertificateBase, Store {
  final _$typeAtom = Atom(name: 'DoctorCertificateBase.type');

  @override
  DoctorCertType get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(DoctorCertType value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  @override
  String toString() {
    return '''
type: ${type}
    ''';
  }
}
