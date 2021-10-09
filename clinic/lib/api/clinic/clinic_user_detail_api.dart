import 'package:clinic/api/base/json_api.dart';
import 'package:clinic/api/base/token_api.dart';
import 'package:clinic/model/clinic_user.dart';

class ClinicUserDetailApi extends TokenApi {
  ClinicUserDetailApi({
    required String token,
  }) : super(token: token);

  @override
  ApiMethod method() {
    return ApiMethod.get;
  }

  @override
  String api() {
    return "clinic/account";
  }

  Future<ClinicUser> run() async {
    var response = await getResult();
    if (response.code == 200 || response.code == 202) {
      return ClinicUser.fromJson(response.data);
    } else {
      return Future.error(response.code);
    }
  }
}
