import 'package:chat_ui_flutter/config/config.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
      // color: Pallete.missedCallRed,
      width: screenWidth,
      height: screenHeight*0.1,
      child: Center(
        child: Padding(
          padding:  EdgeInsets.only(top: screenHeight*0.05),
          child: Text(
            "CALLS",
            style: CustomTextStyle(context: context).returnStyledTextHeadline5(color: Pallete.lightgrey),
          ),
        ),
      ),
    );
  }
}