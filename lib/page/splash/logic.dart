import 'dart:async';

import 'package:flutter_project/page/home/binding.dart';
import 'package:flutter_project/page/home/view.dart';
import 'package:flutter_project/util/logger_util.dart';
import 'package:get/get.dart';

import 'state.dart';

class SplashLogic extends GetxController {
  final SplashState state = SplashState();

  @override
  void onReady() {
    super.onReady();
    Timer(const Duration(milliseconds: 2000), () {
      Get.offAll(() => const HomePage(), binding: HomeBinding());
    });
  }
}
