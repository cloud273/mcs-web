import 'package:clinic/constant.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'certificate.g.dart';

class Certificate = CertificateBase with _$Certificate;

abstract class CertificateBase with Store {
  String code = '';

  String name = '';

  String issuer = '';

  DateTime issueDate = DateTime.now();

  DateTime? expDate;

  @JsonKey(name: 'image')
  String? imageName;

  @computed
  String? get image => imageName != null ? '$ImageUrl/$imageName' : null;
}
