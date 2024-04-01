import 'package:flutter/material.dart';
import 'package:flutter_project/res/images/r.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

/// 欢迎页面
class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(WelcomeLogic());
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: const Color(0xFF40C2BB),
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                R.splash_bg_jpg,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Obx(
            () => Positioned(
              right: 16.w,
              top: 30.w,
              child: InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.w),
                    borderRadius: BorderRadius.all(Radius.circular(8.w)),
                  ),
                  child: Text(
                    logic.state.adStr.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                onTap: () {
                  logic.openHomePage();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
