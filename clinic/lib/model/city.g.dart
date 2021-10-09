// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) {
  return City(
    code: json['code'] as String,
    nameMap: Map<String, String>.from(json['name'] as Map),
  );
}

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.nameMap,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$City on CityBase, Store {
  final _$codeAtom = Atom(name: 'CityBase.code');

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

  final _$nameMapAtom = Atom(name: 'CityBase.nameMap');

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

  @override
  String toString() {
    return '''
code: ${code},
nameMap: ${nameMap}
    ''';
  }
}
