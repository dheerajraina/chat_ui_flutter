import 'dart:developer';

import 'package:chat_ui_flutter/config/config.dart';
import 'package:chat_ui_flutter/models/chat_model.dart';
import 'package:chat_ui_flutter/pages/chat/view/chat_details_page.dart';
import 'package:flutter/material.dart';
import '../../../../global_widgets/global_widgets.dart';

class ChatsListBuilder extends StatelessWidget {
  ChatsListBuilder({super.key, this.chatslist});

  String? imageUrl;

  String? userName;

  List? chatslist = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    log("$chatslist");
    final _textStyleController = CustomTextStyle(context: context);
    if (chatslist!.isNotEmpty) {
      return ListView.builder(
          itemCount: chatslist!.length,
          itemBuilder: (context, index) {
            log("${chatslist![index].profilePictureUrl}");
            return Container(
              // color: Colors.red,
              child: InkWell(
                onTap: () => ontapChatTile(context, index),
                child: CustomUserTile(
                    profilePicture: chatslist![index].profilePictureUrl,
                    title: chatslist![index].name,
                    subtitle: Text(
                      chatslist![index].chats![0].messageText ?? "",
                      // subtitle ?? null,
                      style: _textStyleController.returnStyledTextBodySmall(),
                    ),
                    // chatslist![index].chats![0].messageText,
                    trailing: Text(
                      chatslist![index].chats![0].createdAt ?? "",
                      style: _textStyleController.returnStyledTextBodySmall(),
                    )
                    // chatslist![index].chats![0].createdAt,
                    ),
              ),
            );
          });

      //     Text(
      //   subtitle ?? null,
      //   style: textStyleController.returnStyledTextBodySmall(),
      // )
    }
    return Container(
      child: Center(
        child: Text('No Chats'),
      ),
    );
  }

  ontapChatTile(BuildContext context, int clickedChatIndex) {
    log("Chat Clicked");

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ChatDetailsPage(contact: chatslist![clickedChatIndex])));
  }
}




/*

ListTile(

                onTap: (() {
                  log("Chat Clicked");

                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatDetailsPage(contact:chatslist![index])));

                }),
                contentPadding: EdgeInsets.only(
                    top: size.height * 0.02,
                    bottom: size.height * 0.02,
                    left: size.width * 0.05,
                    right: size.width * 0.05),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    chatslist![index].profilePictureUrl ??
                        "https://media.istockphoto.com/vectors/young-man-anime-style-character-vector-id1188980757?s=170667a",
                  ),
                ),
                title: Text(
                  chatslist![index].name ?? "No Name",
                  style: _textStyleController.returnStyledTextHeadline6()
                  
                ),
                subtitle: Text(
                  chatslist![index].chats[0].messageText ?? "No Name",
                  style: _textStyleController.returnStyledTextBodySmall(),
                ),
                trailing: Text(
                  chatslist![index].chats[0].createdAt ?? "No Name",
                  style:  _textStyleController.returnStyledTextBodySmall(),
                ),
              )

*/