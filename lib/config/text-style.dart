import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class CustomTextStyle{

  CustomTextStyle({/*required this.fontsize,*/required this.context});

  // double fontsize;
  BuildContext context;

  // TextStyle textStyle;

  returnStyledTextBodyLarge({Color?color}){
    return GoogleFonts.lato(textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: color));
  }
   returnStyledTextBodyMedium({Color? color}){
    return GoogleFonts.lato(textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: color));
  }
   returnStyledTextBodySmall({Color? color}){
    return GoogleFonts.lato(textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: color));
  }
   returnStyledTextBodyText1({Color? color}){
    return GoogleFonts.lato(textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: color));
  }
   returnStyledTextHeadline6({Color? color}){
    return GoogleFonts.lato(textStyle: Theme.of(context).textTheme.headline6!.copyWith(color: color));
  }
  
}