import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/logger_util.dart';
import 'state.dart';

class WorkLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final WorkState state = WorkState();

  TabController? tabController;

  String get cityName {
    return state.titleTabs[tabController?.index ?? 0].address;
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      vsync: this,
      length: state.titleTabs.length,
    );
    tabController?.addListener(() {
      state.currentIndex.value = tabController?.index ?? 0;
      state.currentFilter.value = TabFilterEnum.recommend;
      Log().d("-----offset:${tabController?.offset ?? 0}");
    });
  }

  @override
  void onClose() {
    tabController?.dispose();
    super.onClose();
  }

  /// 切换tab筛选
  void changeTabFilter(TabFilterEnum tabFilterEnum) {
    state.currentFilter.value = tabFilterEnum;
  }
}
