import 'package:flutter/material.dart';
import 'package:flutter_project/core/base/page_state.dart';
import 'package:flutter_project/util/logger_util.dart';
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
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("主页"),
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
