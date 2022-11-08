import 'dart:developer';

import 'package:chat_ui_flutter/config/config.dart';
import 'package:flutter/material.dart';

class CustomUserTile extends StatelessWidget {
  CustomUserTile(
      {super.key,
      this.profilePicture,
      this.title,
      this.subtitle,
      this.trailing});

  final String? profilePicture;

  final String? title;
  final  subtitle;
  final  trailing;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final textStyleController = CustomTextStyle(context: context);
    return ListTile(
      onTap: null,
      contentPadding: EdgeInsets.only(
          top: size.height * 0.02,
          bottom: size.height * 0.02,
          left: size.width * 0.05,
          right: size.width * 0.05),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(
          profilePicture ??
              "https://media.istockphoto.com/vectors/young-man-anime-style-character-vector-id1188980757?s=170667a",
        ),
      ),
      title: Text(title ?? "",
          style: textStyleController.returnStyledTextHeadline6()),
      subtitle: subtitle,
      trailing: trailing,
    );
  }
}
