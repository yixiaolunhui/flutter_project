import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil{
  static void show({required String msg}){
    Fluttertoast.showToast(msg: msg);
  }
}