import 'package:clinic/model/city.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'state.g.dart';

@JsonSerializable()
class State extends _State {
  State({
    required String code,
    required Map<String, String> nameMap,
    required List<City> cities,
  }) : super() {
    this.code = code;
    this.nameMap = nameMap;
    this.cities = cities;
  }

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);

  Map<String, dynamic> toJson() => _$StateToJson(this);
}

class _State = StateBase with _$State;

abstract class StateBase with Store {
  @observable
  String code = '';

  @JsonKey(name: 'name')
  @observable
  Map<String, String> nameMap = {};

  @JsonKey(name: 'city')
  @observable
  List<City> cities = [];
}
