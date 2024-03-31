import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(WorkLogic());
    final state = Get.find<WorkLogic>().state;

    return Container(
      color: Colors.blue,
    );
  }
}
