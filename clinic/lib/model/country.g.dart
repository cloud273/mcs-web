// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    code: json['code'] as String,
    nameMap: Map<String, String>.from(json['name'] as Map),
    states: (json['state'] as List<dynamic>)
        .map((e) => State.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.nameMap,
      'state': instance.states,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Country on CountryBase, Store {
  final _$codeAtom = Atom(name: 'CountryBase.code');

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  final _$nameMapAtom = Atom(name: 'CountryBase.nameMap');

  @override
  Map<String, String> get nameMap {
    _$nameMapAtom.reportRead();
    return super.nameMap;
  }

  @override
  set nameMap(Map<String, String> value) {
    _$nameMapAtom.reportWrite(value, super.nameMap, () {
      super.nameMap = value;
    });
  }

  final _$statesAtom = Atom(name: 'CountryBase.states');

  @override
  List<State> get states {
    _$statesAtom.reportRead();
    return super.states;
  }

  @override
  set states(List<State> value) {
    _$statesAtom.reportWrite(value, super.states, () {
      super.states = value;
    });
  }

  @override
  String toString() {
    return '''
code: ${code},
nameMap: ${nameMap},
states: ${states}
    ''';
  }
}
