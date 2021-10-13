import 'package:clinic/model/city.dart';
import 'package:json_annotation/json_annotation.dart';

part 'state.g.dart';

@JsonSerializable()
class State {
  State({
    required this.code,
    required this.nameMap,
    required this.cities,
  });

  String code;

  @JsonKey(name: 'name')
  Map<String, String> nameMap;

  @JsonKey(name: 'city')
  List<City> cities;

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);

  Map<String, dynamic> toJson() => _$StateToJson(this);
}
