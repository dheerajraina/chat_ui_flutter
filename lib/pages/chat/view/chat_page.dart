import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chat_ui_flutter/global_widgets/global_widgets.dart';




class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        

        padding: EdgeInsets.only(top: size.height*0.04),
        child: Scaffold(
           body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            
            children: [

            Center(child: CustomSearchBar(width:size.width*0.8,),),
            // Container(
            //   child: Text(
            //     "hiiiiiiiiiiiiiiiiiiiii",
            //     style: GoogleFonts.lato(textStyle: Theme.of(context).textTheme.bodyLarge),
            //     ),)
           ],)
        ),
      ),
    );
  }
}