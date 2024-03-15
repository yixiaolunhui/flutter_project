import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SplashPage extends StatelessWidget {
   SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red,
        child: Center(
          child: Text(
            "Flutter学习"
          )
        ),
      ),
    );
  }
}
