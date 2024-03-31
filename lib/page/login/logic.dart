import 'package:flutter_project/core/http/http_api.dart';
import 'package:flutter_project/core/http/http_request.dart';
import 'package:flutter_project/core/http/http_url.dart';
import 'package:flutter_project/util/toast_util.dart';
import 'package:get/get.dart';

import 'state.dart';

class LoginLogic extends GetxController with HttpApi {
  final LoginState state = LoginState();

  Future<void> login({
    required String useName,
    required String password,
  }) async {

    String? result = await request<String>(
        method: Method.get,
        path: HttpUrl.loginUrl,
        success: (result) {
          ToastUtil.show(msg: '登录成功');
        },
        fail: (code, msg) {},
        complete: () {});
  }
}
