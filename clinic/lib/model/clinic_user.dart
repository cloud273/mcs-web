import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'clinic_user.g.dart';

@JsonSerializable()
class ClinicUser extends _ClinicUser {
  ClinicUser({
    required String username,
    String? description,
  }) : super() {
    this.username = username;
    this.description = description;
  }

  factory ClinicUser.fromJson(Map<String, dynamic> json) =>
      _$ClinicUserFromJson(json);

  Map<String, dynamic> toJson() => _$ClinicUserToJson(this);
}

class _ClinicUser = ClinicUserBase with _$ClinicUser;

abstract class ClinicUserBase with Store {
  @observable
  String username = '';

  @observable
  String? description;
}
