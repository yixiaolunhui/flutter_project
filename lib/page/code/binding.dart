import 'package:get/get.dart';

import 'logic.dart';

class CodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CodeLogic());
  }
}
