import 'package:clinic/model/state.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'country.g.dart';

@JsonSerializable()
class Country extends _Country {
  Country({
    required String code,
    required Map<String, String> nameMap,
    required List<State> states,
  }) : super() {
    this.code = code;
    this.nameMap = nameMap;
    this.states = states;
  }

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

class _Country = CountryBase with _$Country;

abstract class CountryBase with Store {
  @observable
  String code = '';

  @JsonKey(name: 'name')
  @observable
  Map<String, String> nameMap = {};

  @JsonKey(name: 'state')
  @observable
  List<State> states = [];
}
