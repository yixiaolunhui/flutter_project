import 'dart:async';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_project/page/login/logic.dart';
import 'package:flutter_project/router/routers.dart';
import 'package:get/get.dart';

import 'state.dart';

class CodeLogic extends GetxController {
  final CodeState state = CodeState();
  final int time = 60;
  Timer? _timer;

  ///手机号后四位
  String get phoneNum {
    final loginLogic = Get.find<LoginLogic>();
    var phone = loginLogic.state.phoneNum.value;
    if (phone.isNotEmpty && phone.length == 11) {
      return phone.substring(phone.length - 4);
    }
    return "";
  }

  /// 验证码输入完成
  void codeInputCompleted({required String code}) {
    state.code.value = code;
  }

  /// 验证码是否输入完毕
  bool get codeIsCompleted {
    return state.code.value.length == 4;
  }

  @override
  void onReady() {
    super.onReady();
    _startTimer();
  }

  ///打开计时器
  void _startTimer() {
    _stopTimer();
    state.countDownNum.value = time;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (state.countDownNum.value <= 0) {
        state.countDownNum.value = -1;
        return;
      }
      state.countDownNum.value--;
    });
  }

  ///停止计时器
  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void onClose() {
    _stopTimer();
    super.onClose();
  }

  ///重新发送
  void reSendCode() {
    //发送代码
    _startTimer();
  }

  ///下一步
  void next(BuildContext context) {
    if(!codeIsCompleted){
      return;
    }
    Get.offAllNamed(Routers.homePage);
  }
}
