
import 'dart:developer';

import 'package:chat_ui_flutter/models/chat_model.dart';

import 'package:get/get.dart';
// import '../../utils/chats.json'as chatFile;

import '../../utils/utils.dart';

class ChatController extends GetxController{


  RxList chatsList=[].obs;


  getChats ()async {
    //  var response =await  rootBundle.loadString('lib\\utils\\chats.json').then((value) => value);

    //  var chats =ChatModel.fromJson(jsonDecode(response));


    //  log( "${chats.name}");
    chatsList.value=[];

    chats.forEach((chat) {
      chatsList.add(ChatModel.fromJson(chat));
     });

     log("$chatsList");


    
  }

 

  
  // var chats = ChatModel.fromJson(json);

}