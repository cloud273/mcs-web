// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_certificate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClinicCertificate _$ClinicCertificateFromJson(Map<String, dynamic> json) =>
    ClinicCertificate(
      code: json['code'] as String,
      name: json['name'] as String,
      issuer: json['issuer'] as String,
      issueDate: DateTime.parse(json['issueDate'] as String),
      expDate: json['expDate'] == null
          ? null
          : DateTime.parse(json['expDate'] as String),
      imageName: json['image'] as String?,
      type: $enumDecode(_$ClinicCertTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$ClinicCertificateToJson(ClinicCertificate instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'issuer': instance.issuer,
      'issueDate': instance.issueDate.toIso8601String(),
      'expDate': instance.expDate?.toIso8601String(),
      'image': instance.imageName,
      'type': _$ClinicCertTypeEnumMap[instance.type],
    };

const _$ClinicCertTypeEnumMap = {
  ClinicCertType.working: 'working',
  ClinicCertType.other: 'other',
};

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClinicCertificate on ClinicCertificateBase, Store {
  final _$typeAtom = Atom(name: 'ClinicCertificateBase.type');

  @override
  ClinicCertType get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(ClinicCertType value) {
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
