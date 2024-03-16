import 'package:flutter_project/core/app/app_life_cycle.dart';
import 'package:flutter_project/core/base/page_state.dart';
import 'package:flutter_project/core/error/flutter_error.dart';
import 'package:flutter_project/util/logger_util.dart';
import 'package:flutter_project/util/screen_util.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 初始化时进行依赖注入-全局
class Injection {
  ///初始化
  static Future<void> init() async {
    await Get.putAsync(() => SharedPreferences.getInstance());
    //异常处理
    ErrorHelper.init();
    //路由记录监听器
    RouteHistoryObserver.init();
    //强制竖屏
    ScreenUtils.setPreferredOrientation();
    //暗黑变化监听, （主题变化监听，强制页面UI更新）
    AppLifeCycleDelegate();
    //透明状态栏
    ScreenUtils.setSystemTransparent();
    //整理日志文件
    ConsoleOutput().clearUpLogFile();
  }
}
