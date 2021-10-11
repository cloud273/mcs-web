import 'package:clinic/api/base/api_interceptor.dart';
import 'package:clinic/model/app_info.dart';
import 'package:clinic/util/system_info.dart';
import 'package:dio/dio.dart';

import '../../constant.dart';
import '../../model/extension.dart';
import '../base/api_result.dart';
import '../base/json_api.dart';

class BaseApi extends JsonApi {
  @override
  String host() {
    return ApiUrl;
  }

  @override
  Map<String, String> headers() {
    var result = super.headers();
    result['app'] = AppInfo.instance.id + '|' + SystemInfo.appVersion;
    result['os'] = currentDeviceOS.api;
    return result;
  }

  @override
  Interceptor? interceptor() {
    return ApiInterceptor(
      requestBody: true,
      responseBody: true,
    );
  }

  Future<ApiResult> getResult() async {
    try {
      var response = await getHttpResponse();
      return ApiResult(
          response.statusCode ?? ApiResponseWithoutCode, null, response.data);
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.response:
          return ApiResult(e.response?.statusCode ?? ApiResponseWithoutCode,
              e.message, null);
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.connectTimeout:
          return ApiResult(ApiTimeoutCode, e.error, null);
        default:
          return ApiResult(ApiUnknownErrorCode, e.message, null);
      }
    } catch (e) {
      if (e is int) {
        return ApiResult(e, null, null);
      } else {
        return ApiResult(ApiUnknownErrorCode, null, null);
      }
    }
  }
}
