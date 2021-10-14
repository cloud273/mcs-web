import 'package:clinic/model/clinic.dart';

import '../base/json_api.dart';
import '../base/token_api.dart';

class ClinicDetailApi extends TokenApi {
  ClinicDetailApi({
    required String token,
  }) : super(token: token);

  @override
  ApiMethod method() {
    return ApiMethod.get;
  }

  @override
  String api() {
    return "clinic";
  }

  Future<Clinic> run() async {
    var response = await getResult();
    if (response.code == 200) {
      return Clinic.fromJson(response.data);
    } else {
      return Future.error(response.code);
    }
  }
}
