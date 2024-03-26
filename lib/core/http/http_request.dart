import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_project/core/http/http_exception.dart';
import 'package:flutter_project/core/http/http_url.dart';
import 'package:flutter_project/util/device_util.dart';
import 'package:flutter_project/util/logger_util.dart';
import 'package:flutter_project/util/sp_util.dart';

/// 连接超时时间
const int _connectTimeout = 15000;

/// 发送超时时间
const int _sendTimeout = 15000;

/// 成功回调
typedef Success<T> = Function(T data);

/// 失败回调
typedef Fail = Function(int code, String msg);

/// 完成回调
typedef Complete = VoidCallback;

/// 请求工具
class HttpRequest {
  static Dio? _dio;

  static Dio get dio => createInstance();

  /// 创建 dio 实例对象
  static Dio createInstance({int receiveTimeout = 10000}) {
    if (_dio == null) {
      var options = BaseOptions(
        contentType: Headers.jsonContentType,
        validateStatus: (status) => true,
        sendTimeout: _sendTimeout,
        connectTimeout: _connectTimeout,
        receiveTimeout: receiveTimeout,
        baseUrl: HttpUrl.baseUrl,
      );
      _dio = Dio(options);
    }
    return _dio!;
  }

  static resetDio() {
    _dio = null;
    createInstance();
  }

  /// 请求，返回参数为 T
  static Future<T?> request<T>(
    Method method,
    String path,
    dynamic params,
    Map<String, dynamic>? header, {
    Success<T>? success,
    Fail? fail,
    Complete? complete,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        fail?.call(HttpException.netError, HttpException.netWorkError);
        return Future.value(null);
      }
      Dio dio = createInstance();
      Log().d("request url -> $path request param:$params");
      Response response = await dio.request(
        path,
        data: params,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        options: Options(
          method: _methodValues[method],
          headers: await _headerToken(header, url: path),
        ),
      );
      success?.call(response.data as T);
      return Future.value(response.data as T);
    } on DioError catch (e) {
      final NetError netError = HttpException.handleException(e);
      fail?.call(netError.code, netError.msg);
      Log().d(
          "error =====> message: ${e.message},\ntype:${e.type},\nresponse:${e.response}, \nerror:${e.error}");
      return Future.value(null);
    } finally {
      complete?.call();
    }
  }
}

Future<Map<String, dynamic>?> _headerToken(Map<String, dynamic>? optionalHeader,
    {String? url}) async {
  String sysName = Platform.isIOS ? "iOS" : "Android";
  String appVersion = await DeviceUtil.appVersion();
  String appName = await DeviceUtil.appName();
  String model = await DeviceUtil.phoneModel();
  String osVersion = await DeviceUtil.systemVersion();
  String? token = SpUtil.getToken();
  Map<String, dynamic> httpHeaders = {
    "Model-Type": "PHONE",
    "Os-Type": sysName,
    "Os-Version": osVersion,
    "Phone-Model": model,
    "App-Version": appVersion,
    "App-Name": appName,
    "token": token,
  };
  if (optionalHeader != null) {
    httpHeaders.addAll(optionalHeader);
  }
  Log().d("$url request header -> ${httpHeaders.toString()}");
  return httpHeaders;
}


Map<String, dynamic> parseData(String data) {
  return json.decode(data) as Map<String, dynamic>;
}

enum Method { get, post, delete, put, patch, head }

const _methodValues = {
  Method.get: "get",
  Method.post: "post",
  Method.delete: "delete",
  Method.put: "put",
  Method.patch: "patch",
  Method.head: "head",
};
