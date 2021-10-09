// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

State _$StateFromJson(Map<String, dynamic> json) {
  return State(
    code: json['code'] as String,
    nameMap: Map<String, String>.from(json['name'] as Map),
    cities: (json['city'] as List<dynamic>)
        .map((e) => City.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$StateToJson(State instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.nameMap,
      'city': instance.cities,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$State on StateBase, Store {
  final _$codeAtom = Atom(name: 'StateBase.code');

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

  final _$nameMapAtom = Atom(name: 'StateBase.nameMap');

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

  final _$citiesAtom = Atom(name: 'StateBase.cities');

  @override
  List<City> get cities {
    _$citiesAtom.reportRead();
    return super.cities;
  }

  @override
  set cities(List<City> value) {
    _$citiesAtom.reportWrite(value, super.cities, () {
      super.cities = value;
    });
  }

  @override
  String toString() {
    return '''
code: ${code},
nameMap: ${nameMap},
cities: ${cities}
    ''';
  }
}
