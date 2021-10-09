// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    countryCode: json['country'] as String,
    stateCode: json['state'] as String,
    cityCode: json['city'] as String,
    line: json['line'] as String,
    longitude: (json['longitude'] as num?)?.toDouble(),
    latitude: (json['latitude'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'country': instance.countryCode,
      'state': instance.stateCode,
      'city': instance.cityCode,
      'line': instance.line,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Address on AddressBase, Store {
  final _$countryCodeAtom = Atom(name: 'AddressBase.countryCode');

  @override
  String get countryCode {
    _$countryCodeAtom.reportRead();
    return super.countryCode;
  }

  @override
  set countryCode(String value) {
    _$countryCodeAtom.reportWrite(value, super.countryCode, () {
      super.countryCode = value;
    });
  }

  final _$stateCodeAtom = Atom(name: 'AddressBase.stateCode');

  @override
  String get stateCode {
    _$stateCodeAtom.reportRead();
    return super.stateCode;
  }

  @override
  set stateCode(String value) {
    _$stateCodeAtom.reportWrite(value, super.stateCode, () {
      super.stateCode = value;
    });
  }

  final _$cityCodeAtom = Atom(name: 'AddressBase.cityCode');

  @override
  String get cityCode {
    _$cityCodeAtom.reportRead();
    return super.cityCode;
  }

  @override
  set cityCode(String value) {
    _$cityCodeAtom.reportWrite(value, super.cityCode, () {
      super.cityCode = value;
    });
  }

  final _$lineAtom = Atom(name: 'AddressBase.line');

  @override
  String get line {
    _$lineAtom.reportRead();
    return super.line;
  }

  @override
  set line(String value) {
    _$lineAtom.reportWrite(value, super.line, () {
      super.line = value;
    });
  }

  @override
  String toString() {
    return '''
countryCode: ${countryCode},
stateCode: ${stateCode},
cityCode: ${cityCode},
line: ${line}
    ''';
  }
}
