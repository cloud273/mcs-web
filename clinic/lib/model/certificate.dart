import 'package:clinic/constant.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'certificate.g.dart';

class Certificate = CertificateBase with _$Certificate;

abstract class CertificateBase with Store {

  @observable
  String code = '';

  @observable
  String name = '';

  @observable
  String issuer = '';

  @observable
  DateTime issueDate = DateTime.now();

  @observable
  DateTime? expDate;

  @JsonKey(name: 'image')
  @observable
  String? imageName;

  @computed
  String? get image => imageName!= null ? '$ImageUrl/$imageName' : null;

}