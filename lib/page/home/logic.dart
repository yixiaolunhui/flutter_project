import 'package:flutter_project/core/http/http_api.dart';
import 'package:flutter_project/core/http/http_url.dart';
import 'package:flutter_project/util/logger_util.dart';
import 'package:flutter_project/util/toast_util.dart';
import 'package:get/get.dart';

import '../../core/http/http_request.dart';
import 'state.dart';

class HomeLogic extends GetxController with HttpApi {
  final HomeState state = HomeState();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login() async {
    String? result = await request<String>(
      method: Method.get,
      path: HttpUrl.loginUrl,
      success: (result) {
        state.result.value = result;
        Log().d("login success result:$result");
        ToastUtil.show(msg: '登录成功');
      },
      fail: (code, msg) {
        Log().d("login fail---code:$code msg:$msg");
      },
      complete: (){
        Log().d("login complete");
      }
    );
    Log().d("login request result:$result");
  }
}
