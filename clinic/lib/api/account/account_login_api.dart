import 'package:clinic/model/app_info.dart';
import 'package:clinic/model/enum.dart';
import 'package:clinic/util/system_info.dart';

import '../base/base_api.dart';
import '../base/json_api.dart';

class AccountLoginApi extends BaseApi {
  AccountType type;
  String username;
  String password;
  String? deviceToken;

  AccountLoginApi({
    required this.type,
    required this.username,
    required this.password,
    this.deviceToken,
  });

  @override
  ApiMethod method() {
    return ApiMethod.post;
  }

  @override
  Object body() {
    Map<String, dynamic> device = {
      'info': SystemInfo.deviceInfo,
      'os': currentDeviceOS.text,
      'production': true,
      'topic': AppInfo.instance.id,
      'token': deviceToken,
    };
    if (deviceToken != null) {
      device['token'] = deviceToken!;
    }
    return {
      'login': {
        'username': username,
        'password': password,
      },
      'device': device
    };
  }

  @override
  String api() {
    return "${type.api}/login";
  }

  Future<String> run() async {
    final response = await getResult();
    if (response.code == 200 || response.code == 202) {
      return (response.data)['token'] as String;
    } else {
      return Future.error(response.code);
    }
  }
}
