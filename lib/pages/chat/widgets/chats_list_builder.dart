import 'dart:developer';

import 'package:chat_ui_flutter/models/models.dart';
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
    var size=MediaQuery.of(context).size;
    if (chatslist!.isNotEmpty) {
      return ListView.builder(
          itemCount: chatslist!.length,
          itemBuilder: (context, index) {
            log("${chatslist![index].profilePictureUrl}");
            return Container(
              // color: Colors.red,
              child: ListTile(
                contentPadding: EdgeInsets.only(top: size.height*0.02, bottom: size.height*0.02,left: size.width*0.1 ),
                leading: Container(
                  // color: Colors.amber,
                  child: CircleAvatar(

                    radius: 30,

                    
                    backgroundImage: NetworkImage(
                      chatslist![index].profilePictureUrl ??
                          "https://media.istockphoto.com/vectors/young-man-anime-style-character-vector-id1188980757?s=170667a",
                    
                    ),
                      
                      
                    
                  ),
                ),
                title: Text(
                  chatslist![index].name ?? "No Name",
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.headline6),
                ),
                subtitle: Text(
                  chatslist![index].lastMessageText ?? "No Name",
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodySmall),
                ),
                trailing: Text(
                  chatslist![index].lastMessageAt ?? "No Name",
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodySmall),
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
