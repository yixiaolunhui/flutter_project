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
    required this.child,
  });

  String tabName;
  IconData tabIcon;
  Widget child;
}

class HomeState {
  ///当前索引
  RxInt currentIndex = 0.obs;

  ///底部按钮
  final List<HomeTab> homeBottomBar = [
    HomeTab(tabName: '职位', tabIcon: Icons.work, child: const WorkPage()),
    HomeTab(tabName: '有了', tabIcon: Icons.whatshot, child: const YoulePage()),
    HomeTab(tabName: '消息', tabIcon: Icons.message, child: const MessagePage()),
    HomeTab(tabName: '我的', tabIcon: Icons.person, child: const MinePage()),
  ];
}
