import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  Address({
    required this.countryCode,
    required this.stateCode,
    required this.cityCode,
    required this.line,
    this.longitude,
    this.latitude,
  });

  @JsonKey(name: 'country')
  String countryCode;

  @JsonKey(name: 'state')
  String stateCode;

  @JsonKey(name: 'city')
  String cityCode;

  String line;

  double? longitude;

  double? latitude;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
