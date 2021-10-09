// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Certificate on CertificateBase, Store {
  Computed<String?>? _$imageComputed;

  @override
  String? get image => (_$imageComputed ??=
          Computed<String?>(() => super.image, name: 'CertificateBase.image'))
      .value;

  final _$codeAtom = Atom(name: 'CertificateBase.code');

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

  final _$nameAtom = Atom(name: 'CertificateBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$issuerAtom = Atom(name: 'CertificateBase.issuer');

  @override
  String get issuer {
    _$issuerAtom.reportRead();
    return super.issuer;
  }

  @override
  set issuer(String value) {
    _$issuerAtom.reportWrite(value, super.issuer, () {
      super.issuer = value;
    });
  }

  final _$issueDateAtom = Atom(name: 'CertificateBase.issueDate');

  @override
  DateTime get issueDate {
    _$issueDateAtom.reportRead();
    return super.issueDate;
  }

  @override
  set issueDate(DateTime value) {
    _$issueDateAtom.reportWrite(value, super.issueDate, () {
      super.issueDate = value;
    });
  }

  final _$expDateAtom = Atom(name: 'CertificateBase.expDate');

  @override
  DateTime? get expDate {
    _$expDateAtom.reportRead();
    return super.expDate;
  }

  @override
  set expDate(DateTime? value) {
    _$expDateAtom.reportWrite(value, super.expDate, () {
      super.expDate = value;
    });
  }

  final _$imageNameAtom = Atom(name: 'CertificateBase.imageName');

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
name: ${name},
issuer: ${issuer},
issueDate: ${issueDate},
expDate: ${expDate},
imageName: ${imageName},
image: ${image}
    ''';
  }
}
