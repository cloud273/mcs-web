import 'package:dio/dio.dart';

enum ApiMethod { get, post, put, patch, delete }

class JsonApi {
  String host() {
    return '';
  }

  String api() {
    return '';
  }

  Map<String, dynamic>? queryParameters() {
    return null;
  }

  Map<String, String> headers() {
    return <String, String>{'Content-Type': 'application/json; charset=UTF-8'};
  }

  Object? body() {
    return null;
  }

  ApiMethod method() {
    return ApiMethod.get;
  }

  int milliSecondTimeout() {
    return 30000;
  }

  Interceptor? interceptor() {
    return null;
  }

  Future<Response> getHttpResponse() async {
    try {
      final timeout = milliSecondTimeout();
      final data = body();
      final header = headers();
      final dio = Dio(BaseOptions(
        connectTimeout: timeout,
        sendTimeout: timeout,
        receiveTimeout: timeout,
        baseUrl: host(),
        queryParameters: queryParameters(),
        headers: header,
      ));
      final _interceptor = interceptor();
      if (_interceptor != null) {
        dio.interceptors.add(
          _interceptor,
        );
      }
      var method = this.method();
      if (method == ApiMethod.post) {
        return dio.post(api(), data: data);
      } else if (method == ApiMethod.put) {
        return dio.put(api(), data: data);
      } else if (method == ApiMethod.patch) {
        return dio.patch(api(), data: data);
      } else if (method == ApiMethod.get) {
        return dio.get(api());
      } else if (method == ApiMethod.delete) {
        return dio.delete(api());
      } else {
        return Future.error("$method isn't supported");
      }
    } on DioError catch (e) {
      return Future.error(e);
    } catch (e) {
      return Future.error(e);
    }
  }
}
