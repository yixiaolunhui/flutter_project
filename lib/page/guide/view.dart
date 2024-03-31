import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

/// 引导页
class GuidePage extends StatelessWidget {
  const GuidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(GuideLogic());
    final state = Get.find<GuideLogic>().state;
    return Container(

    );
  }
}
