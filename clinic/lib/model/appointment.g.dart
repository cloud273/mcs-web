// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) {
  return Appointment(
    begin: DateTime.parse(json['begin'] as String),
    specialtyCode: json['specialty'] as String,
    type: _$enumDecode(_$PackageTypeEnumMap, json['type']),
    visitTime: json['visitTime'] as int,
  );
}

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'begin': instance.begin.toIso8601String(),
      'specialty': instance.specialtyCode,
      'type': _$PackageTypeEnumMap[instance.type],
      'visitTime': instance.visitTime,
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
  final _$beginAtom = Atom(name: 'AppointmentBase.begin');

  @override
  DateTime get begin {
    _$beginAtom.reportRead();
    return super.begin;
  }

  @override
  set begin(DateTime value) {
    _$beginAtom.reportWrite(value, super.begin, () {
      super.begin = value;
    });
  }

  final _$specialtyCodeAtom = Atom(name: 'AppointmentBase.specialtyCode');

  @override
  String get specialtyCode {
    _$specialtyCodeAtom.reportRead();
    return super.specialtyCode;
  }

  @override
  set specialtyCode(String value) {
    _$specialtyCodeAtom.reportWrite(value, super.specialtyCode, () {
      super.specialtyCode = value;
    });
  }

  final _$typeAtom = Atom(name: 'AppointmentBase.type');

  @override
  PackageType get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(PackageType value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$visitTimeAtom = Atom(name: 'AppointmentBase.visitTime');

  @override
  int get visitTime {
    _$visitTimeAtom.reportRead();
    return super.visitTime;
  }

  @override
  set visitTime(int value) {
    _$visitTimeAtom.reportWrite(value, super.visitTime, () {
      super.visitTime = value;
    });
  }

  @override
  String toString() {
    return '''
begin: ${begin},
specialtyCode: ${specialtyCode},
type: ${type},
visitTime: ${visitTime}
    ''';
  }
}
