import 'package:flutter_project/page/home/child/message/logic.dart';
import 'package:flutter_project/page/home/child/mine/logic.dart';
import 'package:flutter_project/page/home/child/work/logic.dart';
import 'package:flutter_project/page/home/child/youle/logic.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeLogic());
    Get.lazyPut(() => WorkLogic());
    Get.lazyPut(() => YouleLogic());
    Get.lazyPut(() => MessageLogic());
    Get.lazyPut(() => MineLogic());
  }
}
