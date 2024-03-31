import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_project/util/logger_util.dart';

class ErrorHelper {
  /// 异常捕获处理
  static void init() {
    //捕获异常
    FlutterError.onError = (errorDetails) {
      Log().d('FlutterError onError!');
      _logError(errorDetails.exception, errorDetails.stack);
    };
    //捕获异步异常
    PlatformDispatcher.instance.onError = (error, stack) {
      Log().d('PlatformDispatcher onError!');
      _logError(error, stack);
      return true;
    };
    // 自定义报错页面
    ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
      Log().d(flutterErrorDetails.toString());
      return const Center(child: Text("App Error"));
    };
  }

  /// 打印日志，存到日志文件中
  static Future<void> _logError(dynamic error, dynamic stackTrace) async {
    String logMessage = '''
    ---------------- APP Exception ----------------
    $error$stackTrace
    ---------------- APP Exception ----------------
    ''';
    Log().d(logMessage);
  }
}
