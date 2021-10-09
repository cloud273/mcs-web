import 'package:clinic/api/base/json_api.dart';
import 'package:clinic/api/base/token_api.dart';
import 'package:clinic/model/enum.dart';

class AccountUpdatePasswordApi extends TokenApi {
  AccountType type;
  String password;
  String newPassword;

  AccountUpdatePasswordApi({
    required this.type,
    required String token,
    required this.password,
    required this.newPassword,
  }) : super(token: token);

  @override
  ApiMethod method() {
    return ApiMethod.patch;
  }

  @override
  Object body() {
    return {
      'password': password,
      'newPassword': newPassword,
    };
  }

  @override
  String api() {
    return "${type.api}/update-password";
  }

  Future<String> run() async {
    final response = await getResult();
    if (response.code == 200) {
      return (response.data)['token'] as String;
    } else {
      return Future.error(response.code);
    }
  }
}
