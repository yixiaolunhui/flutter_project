import 'package:flutter/material.dart';
import 'package:flutter_project/core/app/injection.dart';
import 'package:flutter_project/core/base/arguments.dart';
import 'package:flutter_project/core/base/navigation_history_observer.dart';
import 'package:flutter_project/page/splash/binding.dart';
import 'package:flutter_project/page/splash/view.dart';
import 'package:flutter_project/res/intl/string_res.dart';
import 'package:flutter_project/router/routers.dart';
import 'package:flutter_project/util/keyboard_util.dart';
import 'package:flutter_project/util/locale_util.dart';
import 'package:get/get.dart';

/// 环境类型
enum Env { qa, beta, mp }

/// 当前环境类型
Env appEnv = Env.qa;

/// 是否需要调试工具
bool get isNeedUme {
  return appEnv == Env.qa || appEnv == Env.beta;
}

/// 初始化
Future<void> initApp(Env env) async {
  appEnv = env;
  await Injection.init();
  runApp(_myApp());
}

Widget _myApp() {
  return GetMaterialApp(
    getPages: Routers.routePages,
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          body: GestureDetector(
            onTap: () {
              //全局控制-点击空白区域关闭键盘
              KeyboardUtils.hideKeyboard(context);
            },
            child: child,
          ),
        )),
    navigatorObservers: [NavigationHistoryObserver()],
    onGenerateRoute: (settings) {
      var uri = Uri.parse(settings.name ?? "");
      var route = uri.path;
      var params = uri.queryParameters;
      final routePage = Routers.routePages.firstWhereOrNull(
        (routePage) => routePage.name == route,
      );
      if (routePage == null) {
        return null;
      }
      return MaterialPageRoute(
        builder: (context) {
          var widget = routePage.page.call();
          if (widget is RouteQueryMixin) {
            (widget as RouteQueryMixin).routeParams.addAll(params);
          }
          if (widget is ArgumentsMixin) {
            (widget as ArgumentsMixin).arguments = settings.arguments;
          }
          return widget;
        },
        settings: settings,
      );
    },

    //主题颜色
    themeMode: ThemeMode.system,
    // theme: ThemeUtil.lightTheme,
    // darkTheme: ThemeUtil.darkTheme,

    //国际化支持-来源配置
    translations: StringRes(),

    //国际化支持-默认语言
    locale: LocaleOptions.getDefault(),

    //国际化支持-备用语言
    fallbackLocale: const Locale('en', 'US'),

    //默认路由跳转动画
    defaultTransition: Transition.native,

    //初始化启动页的page和binding
    initialBinding: SplashBinding(),

    home: const SplashPage(),
  );
}
