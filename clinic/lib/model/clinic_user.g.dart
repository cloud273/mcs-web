// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClinicUser _$ClinicUserFromJson(Map<String, dynamic> json) {
  return ClinicUser(
    username: json['username'] as String,
    description: json['description'] as String?,
  );
}

Map<String, dynamic> _$ClinicUserToJson(ClinicUser instance) =>
    <String, dynamic>{
      'username': instance.username,
      'description': instance.description,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClinicUser on ClinicUserBase, Store {
  final _$usernameAtom = Atom(name: 'ClinicUserBase.username');

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$descriptionAtom = Atom(name: 'ClinicUserBase.description');

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  @override
  String toString() {
    return '''
username: ${username},
description: ${description}
    ''';
  }
}
