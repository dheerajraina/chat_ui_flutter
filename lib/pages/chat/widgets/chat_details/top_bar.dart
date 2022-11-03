import 'dart:developer';

import 'package:chat_ui_flutter/config/config.dart';

import 'package:chat_ui_flutter/global_widgets/global_widgets.dart';
import 'package:chat_ui_flutter/models/chat_model.dart';

import 'package:flutter/material.dart';

class CustomTopBar extends StatelessWidget {
  CustomTopBar({super.key, required this.contact});

  ChatModel contact;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final _textStyleController = CustomTextStyle(context: context);

    return Container(
      width: screenWidth,
      height: screenHeight * 0.1,
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Row(children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        CustomSpacer().horizontalSpacer(screenWidth * 0.02),
        CircleAvatar(
          // backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(
            contact.profilePictureUrl.toString(),
          ),
        ),
        CustomSpacer().horizontalSpacer(screenWidth * 0.05),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Dheeraj",
              // contact.name.toString(),
              style: _textStyleController.returnStyledTextHeadline6(),
            ),
            Text(
              contact.online ? "Online" : "",
              style: _textStyleController.returnStyledTextBodySmall(
                  color: contact.online ? Pallete.onlineGreen : null
                  ),
            )
          ],
        ),
        CustomSpacer().horizontalSpacer(screenWidth * 0.25),
        IconButton(
            onPressed: () => log("Video Call"), icon: Icon(Icons.video_call)),
        CustomSpacer().horizontalSpacer(screenWidth * 0.05),
        IconButton(onPressed: () => log('Audio Call'), icon: Icon(Icons.call))
      ]),
    );
  }
}
