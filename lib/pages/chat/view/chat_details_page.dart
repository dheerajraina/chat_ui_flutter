import 'package:chat_ui_flutter/models/chat_model.dart';
import 'package:chat_ui_flutter/pages/chat/widgets/widgets.dart';
import 'package:flutter/material.dart';


class ChatDetailsPage extends StatelessWidget {
  ChatDetailsPage({super.key,required this.contact});

  ChatModel contact;
  

  

  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: screenWidth,
          height: screenHeight,
          
          child: Column(
            children: [
              CustomTopBar(contact: contact,),
              SizedBox(width: screenWidth*0.8,child: Divider(thickness: 3,),),
              MessagesUIBuilder(contact: contact,),
            ],
          ),
        ),
      ),
    );
  }
}