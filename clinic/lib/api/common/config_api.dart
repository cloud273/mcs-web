import 'package:clinic/api/base/base_api.dart';
import 'package:clinic/api/base/json_api.dart';

class ConfigApi extends BaseApi {
  ConfigApi();

  @override
  ApiMethod method() {
    return ApiMethod.get;
  }

  @override
  String api() {
    return "config";
  }

  Future<Map<String, dynamic>> run() async {
    final response = await getResult();
    if (response.code == 200) {
      return response.data;
    } else {
      return Future.error(response.code);
    }
  }
}
