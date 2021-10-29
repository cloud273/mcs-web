import '../base/json_api.dart';
import '../base/token_api.dart';

class ClinicAppointmentAcceptApi extends TokenApi {
  ClinicAppointmentAcceptApi({
    required String token,
    required this.id,
    required this.note,
  }) : super(token: token);

  final int id;
  final String note;

  @override
  ApiMethod method() {
    return ApiMethod.patch;
  }

  @override
  String api() {
    return "/clinic/appointment/accept";
  }

  @override
  Object? body() {
    return {
      'id': id,
      'note': note,
    };
  }

  Future<void> run() async {
    var response = await getResult();
    if (response.code == 200) {
      return null;
    } else {
      return Future.error(response.code);
    }
  }
}
