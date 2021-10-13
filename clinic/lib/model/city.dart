import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  City({
    required this.code,
    required this.nameMap,
  });

  String code;

  @JsonKey(name: 'name')
  Map<String, String> nameMap;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
