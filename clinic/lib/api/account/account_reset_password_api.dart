import 'package:clinic/api/base/base_api.dart';
import 'package:clinic/api/base/json_api.dart';
import 'package:clinic/model/enum.dart';

class AccountResetPasswordApi extends BaseApi {
  AccountType type;
  String username;
  String password;
  String code;

  AccountResetPasswordApi({
    required this.type,
    required this.username,
    required this.password,
    required this.code,
  });

  @override
  ApiMethod method() {
    return ApiMethod.patch;
  }

  @override
  Object body() {
    return {
      'username': username,
      'password': password,
      'code': code,
    };
  }

  @override
  String api() {
    return "${type.api}/reset-password";
  }

  Future<String> run() async {
    final response = await getResult();
    if (response.code == 200) {
      return (response.data)['message'] as String;
    } else {
      return Future.error(response.code);
    }
  }
}
