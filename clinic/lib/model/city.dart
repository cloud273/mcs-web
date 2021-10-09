import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'city.g.dart';

@JsonSerializable()
class City extends _City {
  City({
    required String code,
    required Map<String, String> nameMap,
  }) : super() {
    this.code = code;
    this.nameMap = nameMap;
  }

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

class _City = CityBase with _$City;

abstract class CityBase with Store {
  @observable
  String code = '';

  @JsonKey(name: 'name')
  @observable
  Map<String, String> nameMap = {};
}
