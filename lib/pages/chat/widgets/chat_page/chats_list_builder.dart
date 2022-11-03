import 'dart:developer';

import 'package:chat_ui_flutter/config/config.dart';
import 'package:chat_ui_flutter/models/models.dart';
import 'package:chat_ui_flutter/pages/chat/view/view.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatsListBuilder extends StatelessWidget {
  ChatsListBuilder({super.key, this.chatslist});

  String? imageUrl;

  String? userName;

  List? chatslist = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    log("$chatslist");
    final _textStyleController=CustomTextStyle(context: context);
    if (chatslist!.isNotEmpty) {
      return ListView.builder(
          itemCount: chatslist!.length,
          itemBuilder: (context, index) {
            log("${chatslist![index].profilePictureUrl}");
            return Container(
              // color: Colors.red,
              child: ListTile(

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
              ),
            );
          });
    }
    return Container(
      child: Center(
        child: Text('No Chats'),
      ),
    );
  }
}
