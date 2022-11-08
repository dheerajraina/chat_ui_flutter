import 'dart:developer';

import 'package:chat_ui_flutter/models/models.dart';

import '../../utils/utils.dart';

import 'package:get/get.dart';
// import '../../utils/chats.json'as chatFile;

class CallController extends GetxController {
  RxList callsList = [].obs;

  RxString contactImage = "".obs;
  RxString contactName = "".obs;

  getCalls() async {
    callsList.value = [];

    calls.forEach((call) {
      callsList.add(CallModel.fromJson(call));
    });

    log("$callsList");
  }

  // var chats = ChatModel.fromJson(json);

}
