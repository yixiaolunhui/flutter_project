import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(MineLogic());
    final state = Get.find<MineLogic>().state;

    return Container(
      color: Colors.yellow,
    );
  }
}
