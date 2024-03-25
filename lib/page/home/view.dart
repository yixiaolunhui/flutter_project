import 'package:flutter/material.dart';
import 'package:flutter_project/core/base/page_state.dart';
import 'package:flutter_project/util/logger_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends PageState<HomePage> {
  final logic = Get.find<HomeLogic>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Text(
                logic.state.result.value,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.w,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                logic.login();
              },
              child: const Text("登录"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onCreate() {
    super.onCreate();
    Log().d("homepage-onCreate");
  }

  @override
  void onResume() {
    super.onResume();
    Log().d("homepage-onResume");
  }

  @override
  void onPause() {
    super.onPause();
    Log().d("homepage-onPause");
  }

  @override
  void onDestroy() {
    super.onDestroy();
    Log().d("homepage-onDestroy");
  }
}
