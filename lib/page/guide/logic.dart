import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_project/page/page_ext.dart';
import 'package:flutter_project/util/sp_util.dart';
import 'package:get/get.dart';

import 'state.dart';

class GuideLogic extends GetxController {
  final GuideState state = GuideState();
  PageController pageController = PageController();
  Timer? _timer;

  @override
  void onReady() {
    super.onReady();
    _startLoopGuide();
  }

  /// 启动轮询器，每隔3秒切换到下一页
  void _startLoopGuide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      state.currentPageIndex.value = state.currentPageIndex.value == 2
          ? 0
          : state.currentPageIndex.value + 1;
      pageController.animateToPage(
        state.currentPageIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  ///停止轮询
  void _stopLoopGuide() {
    _timer?.cancel();
    _timer == null;
  }

  ///我要招人
  void findPeople() {
    _stopLoopGuide();
    SpUtil.appIsOpen();
    jumpHomePage();
  }

  ///我要应聘
  void findWork() {
    _stopLoopGuide();
    SpUtil.appIsOpen();
    jumpHomePage();
  }

  @override
  void onClose() {
    _stopLoopGuide();
    super.onClose();
  }
}
