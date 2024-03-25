import 'package:dio/dio.dart';
import 'package:flutter_project/core/http/http_request.dart';

mixin HttpApi {
  ///API 请求
  Future request({
    required Method method,
    required String path,
    dynamic params,
    Success? success,
    Fail? fail,
    Complete? complete,
    Map<String, dynamic>? header,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
  }) {
    return HttpRequest.request(
      method,
      path,
      params,
      header,
      success: success,
      fail: fail,
      complete: complete,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
    );
  }
}
