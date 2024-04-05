import 'package:flutter/material.dart';
import 'package:flutter_project/res/images/r.dart';
import 'package:get/get.dart';

import 'logic.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(WorkLogic());
    final state = Get.find<WorkLogic>().state;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              R.work_top_bg_jpg,
              fit: BoxFit.fitWidth,
            ),
          )
        ],
      ),
    );
  }
}
