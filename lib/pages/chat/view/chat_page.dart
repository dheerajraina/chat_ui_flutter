import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chat_ui_flutter/global_widgets/global_widgets.dart';
import '../../../controllers/controller.dart';

import '../widgets/widgets.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  final chatCtrl=Get.put(ChatController());

  @override
  Widget build(BuildContext context) {

    chatCtrl.getChats();
    
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: size.height * 0.04),
        child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
              Center(
                child: CustomSearchBar(
                  width: size.width * 0.8,
                ),
              ),
              CustomSpacer().verticalSpacer(size.height*0.03),
              SizedBox(
                width: size.width*0.8,
                child: Divider(thickness: 2),),
              

              Container(
                // color: Colors.pink,
                child: SizedBox(
                  height: size.height*0.9,
                  child: ChatsListBuilder(chatslist: chatCtrl.chatsList,),
                ),
              )
                      ],
                    ),
            )),
      ),
    );
  }
}
