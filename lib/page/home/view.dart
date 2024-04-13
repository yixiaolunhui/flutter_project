import 'package:flutter/material.dart';
import 'package:flutter_project/core/base/arguments.dart';
import 'package:flutter_project/core/base/page_state.dart';
import 'package:flutter_project/widgets/bottom_bar_item.dart';
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
  final logic = Get.put(HomeLogic());

  @override
  void initState() {
    super.initState();
    logic.handleCurrentIndex(params: widget.routeParams);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
        () => BottomAppBar(
          elevation: 5.0,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              logic.state.homeBottomBar.length,
              (index) => Expanded(
                child: BottomBarItem(
                  tabName: logic.state.homeBottomBar[index].tabName,
                  tabIcon: logic.state.homeBottomBar[index].tabIcon,
                  tabIndex: index,
                  onTap: (index) {
                    logic.state.currentIndex.value = index;
                    logic.pageController.jumpToPage(index);
                  },
                  isChecked: logic.state.currentIndex.value == index,
                  tabSelectedIcon:
                      logic.state.homeBottomBar[index].tabSelectedIcon,
                ),
              ),
            ),
          ),
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
}
