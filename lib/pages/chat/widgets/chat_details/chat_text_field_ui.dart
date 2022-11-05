import 'dart:developer';

import 'package:chat_ui_flutter/config/config.dart';
import 'package:flutter/material.dart';
import 'package:chat_ui_flutter/global_widgets/global_widgets.dart';

class ChatTextFieldUI extends StatelessWidget {
  const ChatTextFieldUI({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.8,
      height: screenHeight * 0.1,
      decoration: const BoxDecoration(
          color: Pallete.lightgrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          )),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 6),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.emoji_emotions_outlined),
              onPressed: (() => log("Emoji Icon Clicked")),
            ),
            CustomTextField(width: screenWidth * 0.4),
            Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: IconButton(
                icon: const Icon(Icons.mic),
                onPressed: (() => log("Mic clicked")),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Pallete.lightBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: IconButton(
                onPressed: (() => log("Send Button Clicked")),
                icon: const Icon(Icons.send),
              ),
            )
          ],
        ),
      ),
    );
  }
}
