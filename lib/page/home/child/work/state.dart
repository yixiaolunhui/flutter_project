import 'package:get/get.dart';

///职位tab
class WorkTab {
  int index;
  String text;
  String address;

  WorkTab({
    required this.index,
    required this.text,
    required this.address,
  });
}

/// 筛选类型
enum TabFilterEnum {
  // 推荐
  recommend,
  // 附近
  nearby,
  // 最新
  latest,
}

extension WorkFilterExt on TabFilterEnum {
  ///名称
  String get filterName {
    switch (this) {
      case TabFilterEnum.recommend:
        return "推荐";
      case TabFilterEnum.nearby:
        return "附近";
      case TabFilterEnum.latest:
        return "最新";
    }
  }
}

class WorkState {
  /// Tab数据
  final List<WorkTab> titleTabs = <WorkTab>[
    WorkTab(
      text: 'Android',
      index: 0,
      address: '南京',
    ),
    WorkTab(
      text: 'Android',
      index: 1,
      address: '北京',
    ),
    WorkTab(
      text: 'Android',
      index: 2,
      address: '上海',
    ),
  ];

  /// 当前tab 筛选
  Rx<TabFilterEnum> currentFilter = TabFilterEnum.recommend.obs;

  /// 当前索引
  RxInt currentIndex = 0.obs;

}
