import 'package:flutter_project/res/intl/strings/en_uk_res.dart';
import 'package:flutter_project/res/intl/strings/en_us_res.dart';
import 'package:flutter_project/res/intl/strings/ja_jp_res.dart';
import 'package:flutter_project/res/intl/strings/zh_cn_res.dart';
import 'package:get/get.dart';

/// 多语言配置
class StringRes extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": enUsRes,
        "en_UK": enUkRes,
        "zh_CN": zhCnRes,
        "ja_JP": jaJpRes,
      };
}
