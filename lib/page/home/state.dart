import 'package:flutter/material.dart';
import 'package:flutter_project/page/home/child/message/view.dart';
import 'package:flutter_project/page/home/child/mine/view.dart';
import 'package:flutter_project/page/home/child/work/view.dart';
import 'package:flutter_project/page/home/child/youle/view.dart';
import 'package:get/get.dart';

class HomeTab {
  HomeTab({
    required this.tabName,
    required this.tabIcon,
    required this.tabSelectedIcon,
    required this.child,
    this.badger = 0,
  });

  String tabName;
  String tabIcon;
  String tabSelectedIcon;
  Widget child;
  int badger;
}

class HomeState {
  ///当前索引
  RxInt currentIndex = 0.obs;

  /// Boss 底部按钮
  final List<HomeTab> homeBottomBar = [
    HomeTab(
      tabName: '职位',
      tabIcon: 'assets/images/tabbar/zhiwei.png',
      tabSelectedIcon: 'assets/images/tabbar/zhiwei.webp',
      child: const WorkPage(),
    ),
    HomeTab(
        tabName: '有了',
        tabIcon: 'assets/images/tabbar/youle.png',
        tabSelectedIcon: 'assets/images/tabbar/youle.webp',
        child: const YoulePage()),
    HomeTab(
        tabName: '消息',
        tabIcon: 'assets/images/tabbar/xiaoxi-c.png',
        tabSelectedIcon: 'assets/images/tabbar/xiaoxi-c.webp',
        child: const MessagePage()),
    HomeTab(
        tabName: '我的',
        tabIcon: 'assets/images/tabbar/wode-c.png',
        tabSelectedIcon: 'assets/images/tabbar/wode-c.webp',
        child: const MinePage()),
  ];

  ///lottie 底部按钮
// final List<HomeTab> homeBottomBar = [
//   HomeTab(
//       tabName: '职位',
//       tabIcon: 'assets/lottie/tab/zhiwei.json',
//       child: const WorkPage()),
//   HomeTab(
//       tabName: '有了',
//       tabIcon: 'assets/lottie/tab/youle.json',
//       child: const YoulePage()),
//   HomeTab(
//       tabName: '消息',
//       tabIcon: 'assets/lottie/tab/xiaoxi-c.json',
//       child: const MessagePage()),
//   HomeTab(
//       tabName: '我的',
//       tabIcon: 'assets/lottie/tab/wode-c.json',
//       child: const MinePage()),
// ];
}
