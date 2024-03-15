import 'package:date_format/date_format.dart';

class DateUtil {
  //获取当前时间日期显示
  static String getCurrentTime() {
    var nowTime = DateTime.now();
    String currentTime = formatDate(
        nowTime, [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]);
    return currentTime;
  }

  //将时间戳转换为时间日期
  static String getTimeEpoch(int time) {
    return DateTime.fromMillisecondsSinceEpoch(time).toString(); //返回时间戳
  }
}
