import 'package:clinic/model/appointment.dart';

import '../base/json_api.dart';
import '../base/token_api.dart';

class ClinicAppointmentDetailApi extends TokenApi {
  ClinicAppointmentDetailApi({
    required String token,
    required this.id,
  }) : super(token: token);

  final int id;

  @override
  ApiMethod method() {
    return ApiMethod.get;
  }

  @override
  Map<String, dynamic>? queryParameters() {
    Map<String, dynamic> map = {
      'id': id,
    };
    return map;
  }

  @override
  String api() {
    return "/clinic/appointment";
  }

  Future<Appointment> run() async {
    var response = await getResult();
    if (response.code == 200) {
      return Appointment.fromJson(response.data);
    } else {
      return Future.error(response.code);
    }
  }
}
