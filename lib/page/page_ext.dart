import 'package:flutter_project/router/routers.dart';
import 'package:flutter_project/util/user_util.dart';
import 'package:get/get.dart';

/// 跳转到首页
/// 已登录-跳转到首页
/// 未登录-跳转到登录页面
void jumpHomePage() {
  if (UserUtil.isLogin()) {
    Get.offAndToNamed(Routers.homePage);
  } else {
    Get.offAndToNamed(Routers.loginPage);
  }
}
