import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(MessageLogic());
    final state = Get.find<MessageLogic>().state;

    return Container(
      color: Colors.red,
    );
  }
}
