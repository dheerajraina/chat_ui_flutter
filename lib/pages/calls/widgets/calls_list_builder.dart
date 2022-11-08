import 'dart:developer';

import 'package:chat_ui_flutter/config/config.dart';
import 'package:chat_ui_flutter/controllers/calls/calls_controller.dart';
import 'package:chat_ui_flutter/controllers/chat/chat_controller.dart';
import 'package:chat_ui_flutter/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CallsListBuilder extends StatelessWidget {
  CallsListBuilder({super.key, required this.callsList});

  List callsList;

  @override
  Widget build(BuildContext context) {
    log("$callsList");
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final _textStyleController = CustomTextStyle(context: context);

    return ListView.builder(
        shrinkWrap: true,
        itemCount: callsList!.length,
        itemBuilder: (context, index) {
          callsList[index].to != "0"
              ? getContactDetails(callsList[index].to)
              : getContactDetails(callsList[index].from);

          // log("Data= ${Get.find<CallController>().contactImage},${Get.find<CallController>().contactName}");

          var bkgImg = Get.find<CallController>().contactImage;
          var cntName = Get.find<CallController>().contactName;
          var creationTime = callsList[index].createdAt;
          var isIncoming = callsList[index].from == "0" ? true : false;
          var isMissed = callsList[index].missed;
          var isAudioCall = callsList[index].type == "audio" ? true : false;

          return Container(
            // color: Colors.red,
            child: InkWell(
              onTap: null,
              child: CustomUserTile(
                profilePicture: bkgImg.value,
                title: cntName.value,
                subtitle: subtitleWidget(screenHeight, screenWidth, isIncoming,
                    isMissed, creationTime),
                trailing: trailingWidget(isAudioCall),
              ),
            ),
          );
        });
  }

  getContactDetails(String? id) {
    Get.find<ChatController>().chatsList.forEach((chat) {
      // log("chat = ${chat.id} $id");
      if (id == chat.id) {
        Get.find<CallController>().contactImage.value = chat.profilePictureUrl;
        Get.find<CallController>().contactName.value = chat.name;
      }
    });
  }

  Widget subtitleWidget(
      screenHeight, screenWidth, isIncoming, isMissed, creationTime) {
    return Row(
      children: [
        isIncoming
            ? Icon(
                Icons.call_received,
                color: isMissed ? Pallete.missedCallRed : Pallete.onlineGreen,
              )
            : Icon(Icons.call_made, color: Pallete.onlineGreen),
        Text(creationTime)
      ],
    );
  }

  Widget trailingWidget(isAudioCall) {
    return !isAudioCall ? Icon(Icons.video_call) : Icon(Icons.call);
  }
}
