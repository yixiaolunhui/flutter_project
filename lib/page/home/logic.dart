import 'package:flutter_project/core/http/http_api.dart';
import 'package:flutter_project/core/http/http_url.dart';
import 'package:get/get.dart';

import '../../core/http/http_request.dart';
import 'state.dart';

class HomeLogic extends GetxController with HttpApi {
  final HomeState state = HomeState();

  @override
  void onInit() {
    super.onInit();
  }

  void login() {
    request(
      method: Method.get,
      path: HttpUrl.loginUrl,
      success: (result) {
        state.result.value = result ?? "";
      },
      fail: (code, msg) {},
    );
  }
}
