import 'dart:developer';

import 'package:chat_ui_flutter/config/config.dart';
import 'package:chat_ui_flutter/controllers/chat/chat_controller.dart';
import 'package:chat_ui_flutter/global_widgets/spacers.dart';
import 'package:chat_ui_flutter/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagesUIBuilder extends StatelessWidget {
  MessagesUIBuilder({super.key, required this.contact});

  ChatModel contact;
  List<Chat>? messages = [];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    messages = contact.chats;

    final _textStyleController = CustomTextStyle(context: context);
    return Container(
      // color: Colors.amber,
      height: screenHeight * 0.7,
      width: screenWidth,

      child: ListView.builder(
          itemCount: messages!.length,
          itemBuilder: (context, index) {
            var chatIndex = (messages!.length - 1) - index;
            var message = messages![chatIndex];
            log("${message.messageText}");
            return Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: message.sentBy == contact.id
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      ChatBubble(
                        chatText: message.messageText.toString(),
                        sentAt: message.createdAt.toString(),
                        bubbleColor: message.sentBy != contact.id
                            ? [
                                Pallete.lightgrey,
                                Color.fromARGB(255, 95, 91, 91)
                              ]
                            : [Pallete.lightBlue, Colors.blueAccent],
                        sentByMe: message.sentBy == contact.id ? false : true,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class ChatBubble extends StatelessWidget {
  ChatBubble(
      {super.key,
      required this.chatText,
      required this.bubbleColor,
      required this.sentByMe,
      required this.sentAt});

  String chatText;
  String sentAt;
  List<Color> bubbleColor;

  bool sentByMe;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.all(8),
        constraints: BoxConstraints(maxWidth: screenWidth * 0.5),
        // color: bubbleColor,
        decoration: BoxDecoration(
          borderRadius: sentByMe
              ? const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  topRight: Radius.circular(15),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
          gradient: LinearGradient(
            colors: bubbleColor,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.only(
            top: screenWidth * 0.05,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            bottom: screenWidth * 0.01),
        child: sentByMe
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // color: Colors.red,
                    child: Text(
                      chatText,
                      style: CustomTextStyle(context: context)
                          .returnStyledTextBodyMedium(),
                    ),
                  ),
                  Container(
                    // color: Colors.pink,
                    child: Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            sentAt,
                            style: CustomTextStyle(context: context)
                                .returnStyledTextBodySmall(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // color: Colors.red,
                    child: Text(
                      chatText,
                      style: CustomTextStyle(context: context)
                          .returnStyledTextBodyMedium(),
                    ),
                  ),
                  Container(
                    // color: Colors.pink,
                    child: Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            sentAt,
                            style: CustomTextStyle(context: context)
                                .returnStyledTextBodySmall(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
  }
}
