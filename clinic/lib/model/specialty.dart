import 'package:clinic/constant.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'specialty.g.dart';

@JsonSerializable()
class Specialty extends _Specialty {
  Specialty({
    required String code,
    required Map<String, String> nameMap,
    String? imageName,
  }) : super() {
    this.code = code;
    this.nameMap = nameMap;
    this.imageName = imageName;
  }

  factory Specialty.fromJson(Map<String, dynamic> json) =>
      _$SpecialtyFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialtyToJson(this);
}

class _Specialty = SpecialtyBase with _$Specialty;

abstract class SpecialtyBase with Store {
  @observable
  String code = '';

  @JsonKey(name: 'name')
  @observable
  Map<String, String> nameMap = {};

  @JsonKey(name: 'image')
  @observable
  String? imageName;

  @computed
  String? get image => imageName != null ? '$ResourceUrl/$imageName' : null;
}
