import 'package:flutter/material.dart';
import 'package:flutter_project/page/home/child/work/state.dart';
import 'package:flutter_project/page/home/child/work/widget/work_list_widget.dart';
import 'package:flutter_project/page/home/child/work/work_test_data_helper.dart';
import 'package:flutter_project/res/colors/color_res.dart';
import 'package:flutter_project/res/images/r.dart';
import 'package:flutter_project/widgets/scale_tabbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(WorkLogic());
    return Obx(
      () => Scaffold(
        backgroundColor: RC.pageBgColor,
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  R.work_top_bg_jpg,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: ScaleTabBar(
            isScrollable: true,
            borderRadius: BorderRadius.circular(10),
            controller: logic.tabController,
            unselectedLabelColor: Colors.white.withAlpha(50),
            labelPadding: EdgeInsets.symmetric(horizontal: 5.w),
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(style: BorderStyle.none),
            ),
            tabs: _workTabsWidget(logic: logic),
          ),
          actions: [
            Icon(
              Icons.add,
              size: 30.w,
              color: Colors.black,
            ),
            SizedBox(
              width: 25.w,
            ),
            Icon(
              Icons.search,
              size: 30.w,
              color: Colors.black,
            ),
            SizedBox(
              width: 25.w,
            ),
          ],
        ),
        body: Column(
          children: [
            _filterWidget(logic: logic),
            Expanded(
              child: TabBarView(
                controller: logic.tabController,
                children: _workListWidget(logic),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// TAB布局
  _workTabsWidget({
    required WorkLogic logic,
  }) {
    List<WorkTab> titleTabs = logic.state.titleTabs;
    return List.generate(titleTabs.length, (index) {
      return Opacity(
        opacity: (index == logic.state.currentIndex.value) ? 1 : 0.5,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleTabs[index].text,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 3.w),
              Container(
                padding: EdgeInsets.only(
                    bottom: 3.w, top: 1.w, left: 2.w, right: 2.w),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  color: RC.themeColor,
                ),
                child: Text(
                  titleTabs[index].address,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 6.sp,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }).toList();
  }

  /// 筛选布局
  _filterWidget({
    required WorkLogic logic,
  }) {
    return Container(
      height: 40.w,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          _filterTabWidget(
            tabFilterEnum: TabFilterEnum.recommend,
            isChecked:
                logic.state.currentFilter.value == TabFilterEnum.recommend,
            logic: logic,
          ),
          SizedBox(width: 16.w),
          _filterTabWidget(
            tabFilterEnum: TabFilterEnum.nearby,
            isChecked: logic.state.currentFilter.value == TabFilterEnum.nearby,
            logic: logic,
          ),
          SizedBox(width: 16.w),
          _filterTabWidget(
            tabFilterEnum: TabFilterEnum.latest,
            isChecked: logic.state.currentFilter.value == TabFilterEnum.latest,
            logic: logic,
          ),
          Expanded(child: Container()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey.withAlpha(50),
            ),
            child: Text(
              logic.cityName,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey.withAlpha(50),
            ),
            child: Text(
              '筛选',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Tab item 布局
  _filterTabWidget({
    required WorkLogic logic,
    required TabFilterEnum tabFilterEnum,
    required bool isChecked,
  }) {
    return GestureDetector(
      onTap: () {
        logic.changeTabFilter(tabFilterEnum);
      },
      child: Text(
        tabFilterEnum.filterName,
        style: TextStyle(
          fontSize: 14.sp,
          color: isChecked ? Colors.black : Colors.grey,
        ),
      ),
    );
  }

  /// 职位列表
  List<Widget> _workListWidget(WorkLogic logic) {
    return logic.state.titleTabs.map((e) {
      return WorkListWidget(
        workList: TestDataGenerator.generateTestData(30),
      );
    }).toList();
  }
}
