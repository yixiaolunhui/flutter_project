import 'package:flutter/material.dart';
import 'package:flutter_project/res/colors/color_res.dart';
import 'package:flutter_project/res/images/r.dart';
import 'package:flutter_project/res/intl/string_res_key.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

/// 引导页
class GuidePage extends StatelessWidget {
  const GuidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(GuideLogic());
    return Stack(
      children: [
        Positioned.fill(
          child: PageView(
            controller: logic.pageController,
            onPageChanged: (index) {
              logic.state.currentPageIndex.value = index;
            },
            children: _guideWidgets(),
          ),
        ),
        Positioned(
          bottom: 50,
          left: 50,
          right: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    logic.findPeople();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10.w),
                    decoration: BoxDecoration(
                      color: RC.themeColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      RS.findPeople.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 40.w,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    logic.findWork();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFF40C2BB),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      RS.findWork.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ///引导页子布局们
  List<Widget> _guideWidgets() {
    return [
      _itemGuideWidget(
        index: 0,
        icon: R.guide_one_png,
        title: '与未来上司直接沟通',
        des: '百万数量boss已入驻，等你开聊',
      ),
      _itemGuideWidget(
        index: 1,
        icon: R.guide_two_png,
        title: '聊着天把工作搞定',
        des: '谈薪资，聊待遇，直接沟通，解答疑问',
      ),
      _itemGuideWidget(
        index: 2,
        icon: R.guide_three_png,
        title: '快速融入新单位',
        des: '找工作到入职，最快只要一天',
      ),
    ];
  }

  ///单个子布局
  Widget _itemGuideWidget({
    required int index,
    required String icon,
    required String title,
    required String des,
  }) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 640 / 628,
          child: Image.asset(
            icon,
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          height: 50.w,
          color: Colors.grey.withAlpha(20),
        ),
        SizedBox(height: 25.w),
        _guideIndexWidget(index: index),
        SizedBox(height: 25.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10.w),
        Text(
          des,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
        Expanded(child: Container()),
      ],
    );
  }

  ///子布局索引
  Widget _guideIndexWidget({required int index}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (index == 0)
                ? const Color(0xFF40C2BB)
                : Colors.grey.withAlpha(50),
          ),
        ),
        SizedBox(width: 10.w),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (index == 1)
                ? const Color(0xFF40C2BB)
                : Colors.grey.withAlpha(50),
          ),
        ),
        SizedBox(width: 10.w),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (index == 2)
                ? const Color(0xFF40C2BB)
                : Colors.grey.withAlpha(50),
          ),
        ),
      ],
    );
  }
}
