import 'package:flutter_project/page/guide/logic.dart';
import 'package:flutter_project/page/home/logic.dart';
import 'package:flutter_project/page/welcome/logic.dart';
import 'package:get/get.dart';

import 'logic.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashLogic());
    Get.lazyPut(() => HomeLogic());
    Get.lazyPut(() => WelcomeLogic());
    Get.lazyPut(() => GuideLogic());
  }
}
