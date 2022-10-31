import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({
    super.key,
    required this.width,
    this.placeholder,
  });

  double width;
  String? placeholder = "Search";

  RxString seachValue = "".obs;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      // color: Colors.red,
      child: SizedBox(
        width: width,
        child: CupertinoSearchTextField(
          placeholder: placeholder,
          placeholderStyle: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.bodyMedium,),
          onChanged: ((value) => onChanged(value)),
        ),
      ),
    );
  }

  onChanged(value) {
    seachValue.value = value;
    log("Search Value = ${seachValue.value}");
  }
}
