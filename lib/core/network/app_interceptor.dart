import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({"content-type": "application/json; charset=utf-8"});
    options.headers.addAll({"Accept": "application/json"});
    return super.onRequest(options, handler);
  }

  @override
  void onError(err, ErrorInterceptorHandler handler) async {
    Fluttertoast.showToast(msg: err.message ?? 'Unexpected error');
    return super.onError(err, handler);
  }
}
