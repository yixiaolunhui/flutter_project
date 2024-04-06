import 'package:flutter/cupertino.dart';
import 'package:flutter_project/core/http/http_api.dart';
import 'package:get/get.dart';

import 'state.dart';

class HomeLogic extends GetxController with HttpApi {
  final HomeState state = HomeState();
  late PageController pageController;


  /// 处理tab默认显示索引
  void handleCurrentIndex({required Map<String, dynamic> params}) {
    int size = state.homeBottomBar.length;
    if (params != null) {
      int tabIndex = params["tabIndex"] ?? 0;
      // 默认加载页面
      if (tabIndex >= size) {
        state.currentIndex.value = size - 1;
      } else {
        state.currentIndex.value = tabIndex;
      }
    }
    // 初始化tab控制器
    pageController = PageController(initialPage: state.currentIndex.value, keepPage: true);
  }
}
