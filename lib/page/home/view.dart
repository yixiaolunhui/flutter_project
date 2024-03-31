import 'package:flutter/material.dart';
import 'package:flutter_project/core/base/arguments.dart';
import 'package:flutter_project/core/base/page_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomePage extends StatefulWidget with RouteQueryMixin {
  HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends PageState<HomePage> with AutomaticKeepAliveClientMixin {
  final logic = Get.find<HomeLogic>();

  @override
  void initState() {
    super.initState();
    logic.handleCurrentIndex(params: widget.routeParams);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _homeBodyWidget(context),
    );
  }

  Widget _homeBodyWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          // 子布局
          PageView(
            controller: logic.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: _bodyContentWidget(),
            onPageChanged: (index) {
              logic.state.currentIndex.value = index;
            },
          ),
        ],
      ),

      // 底部栏
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: logic.state.currentIndex.value,
          elevation: 5.0,
          selectedFontSize: 14.sp,
          unselectedFontSize: 14.sp,
          onTap: (int index) async {
            logic.state.currentIndex.value = index;
            logic.pageController.jumpToPage(index);
          },
          items: _bottomTabsWidget(), // 底部菜单导航
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  /// 子布局集合
  List<Widget> _bodyContentWidget() {
    return logic.state.homeBottomBar.map((item) => item.child).toList();
  }

  /// tab布局集合
  List<BottomNavigationBarItem> _bottomTabsWidget() {
    return logic.state.homeBottomBar.map<BottomNavigationBarItem>((item) {
      return BottomNavigationBarItem(
        icon: Icon(
          item.tabIcon,
          size: 22.w,
        ),
        label: item.tabName,
      );
    }).toList();
  }
}
