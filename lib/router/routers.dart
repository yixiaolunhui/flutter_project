import 'package:flutter_project/page/code/binding.dart';
import 'package:flutter_project/page/code/view.dart';
import 'package:flutter_project/page/home/binding.dart';
import 'package:flutter_project/page/home/view.dart';
import 'package:flutter_project/page/login/binding.dart';
import 'package:flutter_project/page/login/view.dart';
import 'package:flutter_project/page/splash/binding.dart';
import 'package:flutter_project/page/splash/view.dart';
import 'package:get/get.dart';

/// 页面管理路由表
abstract class Routers {
  // 启动页
  static const String splashPage = '/splash';

  // 首页
  static const String homePage = '/home';

  // 登录
  static const String loginPage = '/login';

  // 验证码
  static const String codePage = '/code';

  static final routePages = [
    GetPage(
      name: splashPage,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: homePage,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: loginPage,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: codePage,
      page: () => const CodePage(),
      binding: CodeBinding(),
    ),
  ];
}
