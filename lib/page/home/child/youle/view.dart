import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class YoulePage extends StatelessWidget {
  const YoulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(YouleLogic());
    final state = Get.find<YouleLogic>().state;

    return Container(
      color: Colors.deepOrange,
    );
  }
}
