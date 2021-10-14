// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) {
  return Appointment(
    id: json['id'] as int,
    code: json['code'] as String,
    order: json['order'] as int,
    begin: DateTime.parse(json['begin'] as String),
    specialtyCode: json['specialty'] as String,
    type: _$enumDecode(_$PackageTypeEnumMap, json['type']),
    visitTime: json['visitTime'] as int,
    price: json['price'] == null
        ? null
        : Price.fromJson(json['price'] as Map<String, dynamic>),
    status: AptStatus.fromJson(json['status'] as Map<String, dynamic>),
    doctor: Doctor.fromJson(json['doctorInfo'] as Map<String, dynamic>),
    patient: Patient.fromJson(json['patientInfo'] as Map<String, dynamic>),
    clinic: Clinic.fromJson(json['clinicInfo'] as Map<String, dynamic>),
    symptoms: (json['symptoms'] as List<dynamic>?)
        ?.map((e) => Symptom.fromJson(e as Map<String, dynamic>))
        .toList(),
    allergies: (json['allergies'] as List<dynamic>?)
        ?.map((e) => Allergy.fromJson(e as Map<String, dynamic>))
        .toList(),
    surgeries: (json['surgeries'] as List<dynamic>?)
        ?.map((e) => Surgery.fromJson(e as Map<String, dynamic>))
        .toList(),
    medications: (json['medications'] as List<dynamic>?)
        ?.map((e) => Medication.fromJson(e as Map<String, dynamic>))
        .toList(),
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'status': instance.status,
      'id': instance.id,
      'code': instance.code,
      'order': instance.order,
      'begin': instance.begin.toIso8601String(),
      'specialty': instance.specialtyCode,
      'type': _$PackageTypeEnumMap[instance.type],
      'visitTime': instance.visitTime,
      'price': instance.price,
      'doctorInfo': instance.doctor,
      'patientInfo': instance.patient,
      'clinicInfo': instance.clinic,
      'symptoms': instance.symptoms,
      'allergies': instance.allergies,
      'surgeries': instance.surgeries,
      'medications': instance.medications,
      'description': instance.description,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$PackageTypeEnumMap = {
  PackageType.classic: 'classic',
  PackageType.telemed: 'telemed',
};

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Appointment on AppointmentBase, Store {
  final _$statusAtom = Atom(name: 'AppointmentBase.status');

  @override
  AptStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(AptStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  @override
  String toString() {
    return '''
status: ${status}
    ''';
  }
}
