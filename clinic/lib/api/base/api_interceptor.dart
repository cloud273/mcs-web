import 'dart:async';

import 'package:clinic/util/log.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor({
    this.requestHeader = true,
    this.requestBody = false,
    this.responseHeader = true,
    this.responseBody = false,
  });

  /// Print request header [Options.headers]
  final bool requestHeader;

  /// Print request data [Options.data]
  final bool requestBody;

  /// Print [Response.data]
  final bool responseBody;

  /// Print [Response.headers]
  final bool responseHeader;

  String _message = "";

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    _addMessage('*** Request ***');
    _add('uri', options.uri);
    _add('method', options.method);
    _add('responseType', options.responseType.toString());
    _add('followRedirects', options.followRedirects);
    _add('connectTimeout', options.connectTimeout);
    _add('receiveTimeout', options.receiveTimeout);
    if (requestHeader) {
      _addMessage('extra:');
      options.extra.forEach((key, v) => _add('$key', v));
      _addMessage('headers:');
      options.headers.forEach((key, v) => _add('$key', v));
    }
    if (requestBody) {
      _addMessage('body:');
      _addMessage(options.data.toString());
    }
    handler.next(options);
  }

  @override
  Future onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    _addMessage('*** DioError ***');
    _addMessage('$err');
    if (err.response != null) {
      _addMessage(err.response.toString());
    }
    logDatabase.add(_message);
    handler.next(err);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    _addMessage('*** Response ***');
    _add('statusCode', response.statusCode);
    if (response.isRedirect == true) {
      _add('redirect', response.realUri);
    }
    if (responseHeader) {
      _addMessage('extra:');
      response.extra.forEach((key, v) => _add('$key', v.join(',')));
      _addMessage('headers:');
      response.headers.forEach((key, v) => _add('$key', v.join(',')));
    }
    if (responseBody) {
      _addMessage('data:');
      _addMessage(response.toString());
    }
    logDatabase.add(_message);
    handler.next(response);
  }

  void _add(String? key, Object? v) {
    if (_message.length > 0) _message += '\n';
    _message += '${key ?? 'null'}: ${v ?? 'null'}';
  }

  void _addMessage(String? msg) {
    if (_message.length > 0) _message += '\n';
    _message += '${msg ?? 'null'}';
  }
}
