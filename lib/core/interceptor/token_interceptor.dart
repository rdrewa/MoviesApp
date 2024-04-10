import 'package:dio/dio.dart';

import '../../app/config.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer ${Config.apiToken}';
    super.onRequest(options, handler);
  }
}
