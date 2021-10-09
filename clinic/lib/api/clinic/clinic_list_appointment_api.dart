import 'dart:convert';

import 'package:clinic/api/utility.dart';
import 'package:clinic/model/appointment.dart';
import 'package:clinic/model/enum.dart';

import '../base/json_api.dart';
import '../base/token_api.dart';

class ClinicListAppointmentApi extends TokenApi {
  ClinicListAppointmentApi({
    required String token,
    this.type,
    this.statusTypes,
    required this.from,
    required this.to,
  }) : super(token: token);

  final PackageType? type;
  final List<AptStatusType>? statusTypes;
  final DateTime from;
  final DateTime to;

  @override
  ApiMethod method() {
    return ApiMethod.get;
  }

  @override
  Map<String, dynamic>? queryParameters() {
    Map<String, dynamic> map = {
      'from': Uri.encodeFull(DateConverter.toDateTimeString(date: from)),
      'to': Uri.encodeFull(DateConverter.toDateTimeString(date: to))
    };
    if (statusTypes != null) {
      List<String> jsonStatus = [];
      statusTypes!.forEach((element) {
        jsonStatus.add(element.text);
      });
      map['statusTypes'] = base64.encode(jsonEncode(jsonStatus).codeUnits);
    }
    if (type != null) {
      map['type'] = type!.text;
    }
    return map;
  }

  @override
  String api() {
    return "/clinic/appointment/list";
  }

  Future<List<Appointment>> run() async {
    var response = await getResult();
    if (response.code == 200 || response.code == 202) {
      return (response.data as List)
          .map((e) => Appointment.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      return Future.error(response.code);
    }
  }
}
