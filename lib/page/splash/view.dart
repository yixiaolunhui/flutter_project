import 'package:flutter/material.dart';
import 'package:flutter_project/page/guide/view.dart';
import 'package:flutter_project/page/welcome/view.dart';
import 'package:flutter_project/util/sp_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 启动页面-欢迎界面/引导页面
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    var child = SpUtil.isFirstOpen() ? const GuidePage() : const WelcomePage();
    return Scaffold(
      body: child,
      resizeToAvoidBottomInset: false,
    );
  }
}
