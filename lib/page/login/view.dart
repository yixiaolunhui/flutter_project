import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/res/colors/color_res.dart';
import 'package:flutter_project/res/images/r.dart';
import 'package:flutter_project/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<LoginLogic>();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(24.w, 60.w, 24.w, 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "手机号登录/注册",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30.sp,
                color: RC.text1Color,
              ),
            ),
            SizedBox(height: 6.w),
            Text(
              "首次验证通过即注册BOSS直聘账号",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: RC.text2Color,
              ),
            ),
            SizedBox(height: 10.w),
            Row(
              children: [
                Text(
                  "+86",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 25.w,
                  color: Colors.black.withAlpha(70),
                ),
                Expanded(
                  child: TextField(
                    controller: logic.controller,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    style: TextStyle(color: Colors.black, fontSize: 18.sp),
                    onChanged: (value) {
                      logic.state.phoneNum.value = value;
                    },
                    decoration: InputDecoration(
                      hintText: '请输入您的手机号码',
                      // 设置 hintText
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18.sp),
                      // 设置 hintText 的颜色
                      border: InputBorder.none,
                      // 取消底部下划线
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.transparent), // 取消输入框选中时的边框颜色
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.transparent), // 取消输入框获取焦点时的边框颜色
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 1.w,
              color: Colors.grey,
            ),
            SizedBox(height: 16.w),
            Obx(
              () => InkWell(
                onTap: () {
                  logic.state.isAgree.value = !logic.state.isAgree.value;
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Icon(
                        logic.state.isAgree.value
                            ? Icons.check_circle
                            : Icons.circle_outlined,
                        size: 18.r,
                        color: logic.state.isAgree.value
                            ? RC.themeColor
                            : Colors.grey,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child:
                      RichText(
                        text: TextSpan(
                          text: '已阅读并同意',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => InkWell(
                onTap: () {
                  logic.next(context);
                },
                child: Container(
                  height: 50.w,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20.w, bottom: 30.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      color: logic.state.phoneNum.isNotEmpty
                          ? RC.themeColor
                          : RC.themeColor.withAlpha(50)),
                  child: Text(
                    "下一步",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              "接受不到短信",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "或通过以下方式登录",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 20.w),
                    InkWell(
                      onTap: () {
                        logic.wxLogin();
                      },
                      child: Image.asset(
                        R.login_wx_png,
                        width: 50.w,
                        height: 50.w,
                      ),
                    ),
                    SizedBox(height: 35.w),
                    Text(
                      "服务热线 举报监督电话 资质证照",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
