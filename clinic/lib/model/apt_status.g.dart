// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apt_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AptStatus _$AptStatusFromJson(Map<String, dynamic> json) {
  return AptStatus(
    by: _$enumDecode(_$UserTypeEnumMap, json['by']),
    value: _$enumDecode(_$AptStatusTypeEnumMap, json['value']),
    note: json['note'] as String?,
  );
}

Map<String, dynamic> _$AptStatusToJson(AptStatus instance) => <String, dynamic>{
      'by': _$UserTypeEnumMap[instance.by],
      'value': _$AptStatusTypeEnumMap[instance.value],
      'note': instance.note,
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

const _$UserTypeEnumMap = {
  UserType.patient: 'patient',
  UserType.clinic: 'clinic',
  UserType.doctor: 'doctor',
  UserType.system: 'system',
};

const _$AptStatusTypeEnumMap = {
  AptStatusType.created: 'created',
  AptStatusType.accepted: 'accepted',
  AptStatusType.started: 'started',
  AptStatusType.rejected: 'rejected',
  AptStatusType.cancelled: 'cancelled',
  AptStatusType.finished: 'finished',
};

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AptStatus on AptStatusBase, Store {
  @override
  String toString() {
    return '''

    ''';
  }
}
