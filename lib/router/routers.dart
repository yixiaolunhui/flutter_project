import 'package:flutter_project/page/home/binding.dart';
import 'package:flutter_project/page/home/view.dart';
import 'package:flutter_project/page/splash/binding.dart';
import 'package:flutter_project/page/splash/view.dart';
import 'package:get/get.dart';

/// 页面管理路由表
abstract class Routers {
  // 启动页
  static const String splashPage = '/splash';

  // 首页
  static const String homePage = '/home';

  static final routePages = [
    GetPage(
      name: splashPage,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: homePage,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
