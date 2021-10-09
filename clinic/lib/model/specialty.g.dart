// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialty.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Specialty _$SpecialtyFromJson(Map<String, dynamic> json) {
  return Specialty(
    code: json['code'] as String,
    nameMap: Map<String, String>.from(json['name'] as Map),
    imageName: json['image'] as String?,
  );
}

Map<String, dynamic> _$SpecialtyToJson(Specialty instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.nameMap,
      'image': instance.imageName,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Specialty on SpecialtyBase, Store {
  Computed<String?>? _$imageComputed;

  @override
  String? get image => (_$imageComputed ??=
          Computed<String?>(() => super.image, name: 'SpecialtyBase.image'))
      .value;

  final _$codeAtom = Atom(name: 'SpecialtyBase.code');

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

  final _$nameMapAtom = Atom(name: 'SpecialtyBase.nameMap');

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

  final _$imageNameAtom = Atom(name: 'SpecialtyBase.imageName');

  @override
  String? get imageName {
    _$imageNameAtom.reportRead();
    return super.imageName;
  }

  @override
  set imageName(String? value) {
    _$imageNameAtom.reportWrite(value, super.imageName, () {
      super.imageName = value;
    });
  }

  @override
  String toString() {
    return '''
code: ${code},
nameMap: ${nameMap},
imageName: ${imageName},
image: ${image}
    ''';
  }
}
