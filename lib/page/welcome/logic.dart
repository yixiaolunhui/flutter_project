import 'dart:async';

import 'package:flutter_project/router/routers.dart';
import 'package:get/get.dart';

import 'state.dart';

class WelcomeLogic extends GetxController {
  final WelcomeState state = WelcomeState();
  int _timeCount = 3;
  Timer? _timer;

  @override
  void onReady() {
    super.onReady();
    _startTimer();
  }

  ///打开计时器
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      state.adStr.value = "广告$_timeCount秒跳过";
      if (_timeCount <= 0) {
        openHomePage();
        return;
      }
      _timeCount--;
    });
  }

  ///停止计时器
  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  /// 打开首页
  void openHomePage() {
    _stopTimer();
    Get.offAndToNamed(Routers.homePage);
  }

  @override
  void onClose() {
    _stopTimer();
    super.onClose();
  }
}
