import 'package:chat_ui_flutter/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.width});

  double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        style: CustomTextStyle(context: context).returnStyledTextHeadline6(),
        decoration: const InputDecoration(
          border: UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
