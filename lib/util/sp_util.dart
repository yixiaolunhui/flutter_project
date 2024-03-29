import 'dart:convert';

import 'package:flutter_project/model/language.dart';
import 'package:flutter_project/util/logger_util.dart';
import 'package:flutter_project/util/sp_key.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 键值对存储
class SpUtil {
  ///Token
  static String getToken() {
    SharedPreferences sp = Get.find<SharedPreferences>();
    return sp.getString(SPKey.token) ?? "";
  }

  /// Token
  static setToken(String token) {
    Get.find<SharedPreferences>().setString(SPKey.token, token);
  }

  ///存储语言
  ///[Language] 语言
  static updateLanguage(Language language) {
    Get.find<SharedPreferences>()
        .setString(SPKey.language, jsonEncode(language.toJson()));
  }

  ///获取语言选项
  ///[Language] 语言
  static Language? getLanguage() {
    SharedPreferences sp = Get.find<SharedPreferences>();
    try {
      var json = sp.getString(SPKey.language);
      if (json == null) {
        return null;
      } else {
        return Language.fromJson(jsonDecode(json));
      }
    } on Exception catch (e) {
      Log().d(e.toString());
      return null;
    }
  }
}
