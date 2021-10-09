import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'address.g.dart';

@JsonSerializable()
class Address extends _Address {
  Address({
    required String countryCode,
    required String stateCode,
    required String cityCode,
    required String line,
    double? longitude,
    double? latitude,
  }) : super() {
    this.countryCode = countryCode;
    this.stateCode = stateCode;
    this.cityCode = cityCode;
    this.line = line;
    this.longitude = longitude;
    this.latitude = latitude;
  }

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

class _Address = AddressBase with _$Address;

abstract class AddressBase with Store {
  @JsonKey(name: 'country')
  @observable
  String countryCode = '';

  @JsonKey(name: 'state')
  @observable
  String stateCode = '';

  @JsonKey(name: 'city')
  @observable
  String cityCode = '';

  @observable
  String line = '';

  double? longitude;

  double? latitude;
}
