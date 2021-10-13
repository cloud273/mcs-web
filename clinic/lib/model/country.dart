import 'package:clinic/model/state.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  Country({
    required this.code,
    required this.nameMap,
    required this.states,
  });

  String code;

  @JsonKey(name: 'name')
  Map<String, String> nameMap;

  @JsonKey(name: 'state')
  List<State> states;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
