// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) {
  return Appointment(
    code: json['code'] as String,
    order: json['order'] as int,
    begin: DateTime.parse(json['begin'] as String),
    specialtyCode: json['specialty'] as String,
    type: _$enumDecode(_$PackageTypeEnumMap, json['type']),
    visitTime: json['visitTime'] as int,
    status: AptStatus.fromJson(json['status'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'code': instance.code,
      'order': instance.order,
      'begin': instance.begin.toIso8601String(),
      'specialty': instance.specialtyCode,
      'type': _$PackageTypeEnumMap[instance.type],
      'visitTime': instance.visitTime,
      'status': instance.status,
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
  AptStatus? get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(AptStatus? value) {
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
