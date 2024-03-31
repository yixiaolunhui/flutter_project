import 'package:flutter/material.dart';
import 'package:flutter_project/res/images/r.dart';
import 'package:get/get.dart';

import 'logic.dart';

/// 欢迎页面
class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(WelcomeLogic());
    final state = Get.find<WelcomeLogic>().state;
    return Container(
      color: const Color(0xFF40C2BB),
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        R.image2_webp,
        fit: BoxFit.cover,
      ),
    );
  }
}
