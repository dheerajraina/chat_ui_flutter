import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSpacer{

  Widget verticalSpacer(double height){
    return SizedBox(
      height: height,
    );
  }
   Widget horizontalSpacer(double width){
    return SizedBox(
      width: width,
    );
  }
}