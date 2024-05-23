import 'package:dio/dio.dart';

class B4aIntercept extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.baseUrl = const String.fromEnvironment('base_url');
    options.headers.addAll({
      'X-Parse-Application-Id': const String.fromEnvironment('parse_id'),
      'X-Parse-REST-API-Key': const String.fromEnvironment('parse_rest_key'),
    });
    super.onRequest(options, handler);
  }
}
