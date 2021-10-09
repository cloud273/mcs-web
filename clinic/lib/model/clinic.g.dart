// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Clinic _$ClinicFromJson(Map<String, dynamic> json) {
  return Clinic(
    name: json['name'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
    workPhone: json['workPhone'] as String?,
    address: Address.fromJson(json['address'] as Map<String, dynamic>),
    certificates: (json['certificates'] as List<dynamic>?)
        ?.map((e) => ClinicCertificate.fromJson(e as Map<String, dynamic>))
        .toList(),
    imageName: json['image'] as String?,
  );
}

Map<String, dynamic> _$ClinicToJson(Clinic instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'workPhone': instance.workPhone,
      'address': instance.address,
      'certificates': instance.certificates,
      'image': instance.imageName,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Clinic on ClinicBase, Store {
  Computed<String?>? _$imageComputed;

  @override
  String? get image => (_$imageComputed ??=
          Computed<String?>(() => super.image, name: 'ClinicBase.image'))
      .value;

  final _$nameAtom = Atom(name: 'ClinicBase.name');

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

  final _$emailAtom = Atom(name: 'ClinicBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$phoneAtom = Atom(name: 'ClinicBase.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$workPhoneAtom = Atom(name: 'ClinicBase.workPhone');

  @override
  String? get workPhone {
    _$workPhoneAtom.reportRead();
    return super.workPhone;
  }

  @override
  set workPhone(String? value) {
    _$workPhoneAtom.reportWrite(value, super.workPhone, () {
      super.workPhone = value;
    });
  }

  final _$addressAtom = Atom(name: 'ClinicBase.address');

  @override
  Address get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(Address value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$certificatesAtom = Atom(name: 'ClinicBase.certificates');

  @override
  List<ClinicCertificate>? get certificates {
    _$certificatesAtom.reportRead();
    return super.certificates;
  }

  @override
  set certificates(List<ClinicCertificate>? value) {
    _$certificatesAtom.reportWrite(value, super.certificates, () {
      super.certificates = value;
    });
  }

  final _$imageNameAtom = Atom(name: 'ClinicBase.imageName');

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
name: ${name},
email: ${email},
phone: ${phone},
workPhone: ${workPhone},
address: ${address},
certificates: ${certificates},
imageName: ${imageName},
image: ${image}
    ''';
  }
}
