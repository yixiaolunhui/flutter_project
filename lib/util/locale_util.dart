import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_project/model/language.dart';
import 'package:flutter_project/util/logger_util.dart';
import 'package:flutter_project/util/sp_util.dart';
import 'package:get/get.dart';

/// 语言工具类
class LocaleOptions {
  ///更新语言
  static updateLocale(Language language) {
    Locale? locale;
    SpUtil.updateLanguage(language);
    if (language.language == '' || language.country == '') {
      locale = Get.deviceLocale;
    } else {
      locale = Locale(language.language, language.country);
    }
    if (locale != null) {
      Get.updateLocale(locale);
    }
  }

  ///获取当前存储的默认语言
  static Locale getDefault() {
    var language = SpUtil.getLanguage();
    if (language == null || language.language == '' || language.country == '') {
      Log().d('当前语言或者地区为空');
      var local = Get.deviceLocale;
      var localLanguage = languageList
          .firstWhereOrNull((e) => e.language == local?.languageCode);
      if (localLanguage != null) {
        Log().d('加载具体的语言: ${localLanguage.country}, ${localLanguage.language}');
        SpUtil.updateLanguage(localLanguage);
        return Locale(localLanguage.language, localLanguage.country);
      } else {
        Log().d('加载默认的语言');
        SpUtil.updateLanguage(defLanguage);
        return Locale(defLanguage.language, defLanguage.country);
      }
    } else {
      return Locale(language.language, language.country);
    }
  }
}
