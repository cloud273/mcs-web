import 'package:clinic/api/base/base_api.dart';
import 'package:clinic/api/base/json_api.dart';
import 'package:clinic/model/enum.dart';

class AccountResetPasswordRequestApi extends BaseApi {
  AccountType type;
  String username;
  Language language;

  AccountResetPasswordRequestApi({
    required this.type,
    required this.username,
    required this.language,
  });

  @override
  ApiMethod method() {
    return ApiMethod.patch;
  }

  @override
  Map<String, String> headers() {
    return {
      'language': language.code,
    };
  }

  @override
  Object body() {
    return {
      'username': username,
    };
  }

  @override
  String api() {
    return "${type.api}/reset-password-request";
  }

  Future<NotifyType> run() async {
    final response = await getResult();
    if (response.code == 200) {
      return NotifyTypeExtension.parse(response.data['code'] as String)!;
    } else {
      return Future.error(response.code);
    }
  }
}
