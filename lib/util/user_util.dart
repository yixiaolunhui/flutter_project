import 'package:flutter_project/util/sp_util.dart';

class UserUtil {

  /// 是否登录
  static bool isLogin() {
    return SpUtil.getToken().isNotEmpty;
  }

}
