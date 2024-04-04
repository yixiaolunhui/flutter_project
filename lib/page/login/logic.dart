import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/core/http/http_api.dart';
import 'package:flutter_project/res/colors/color_res.dart';
import 'package:flutter_project/router/routers.dart';
import 'package:flutter_project/util/regex_util.dart';
import 'package:flutter_project/util/toast_util.dart';
import 'package:get/get.dart';

import 'state.dart';

///登录页面
class LoginLogic extends GetxController with HttpApi {
  final LoginState state = LoginState();
  final TextEditingController controller = TextEditingController();

  /// 微信登录
  void wxLogin() {
    ToastUtil.show(msg: '微信登录');
  }

  /// 下一步
  void next(BuildContext context) {
    //为空不能执行下一步
    if (state.phoneNum.value.isEmpty) {
      return;
    }
    //手机号不符合要求
    if (!RegexUtil.isMobileSimple(state.phoneNum.value)) {
      ToastUtil.show(msg: '请输入正确的手机号');
      return;
    }
    if (!state.isAgree.value) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: RichText(
              text: TextSpan(
                text: '请阅读并同意',
                style: const TextStyle(color: Colors.black, fontSize: 16),
                children: [
                  TextSpan(
                    text: '《BOSS直聘用户协议》',
                    style: const TextStyle(color: RC.themeColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        ToastUtil.show(msg: "跳转到BOSS直聘用户协议");
                      },
                  ),
                  const TextSpan(
                    text: ' 和 ',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  TextSpan(
                    text: '《隐私政策》',
                    style: const TextStyle(color: RC.themeColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        ToastUtil.show(msg: "跳转到隐私政策");
                      },
                  ),
                  const TextSpan(
                    text: '，允许BOSS直聘统一管理本人账号信息',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  '拒绝',
                  style: TextStyle(
                    fontSize: 16,
                    color: RC.themeColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  state.isAgree.value = true;
                  Navigator.of(context).pop();
                },
                child: const Text(
                  '同意',
                  style: TextStyle(
                    fontSize: 16,
                    color: RC.themeColor,
                  ),
                ),
              ),
            ],
          );
        },
      );
      return;
    }

    //跳转到验证码界面
    Get.toNamed(Routers.codePage);
  }
}
