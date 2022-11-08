import 'package:chat_ui_flutter/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/widgets.dart';

class CallsPage extends StatelessWidget {
  CallsPage({super.key});

  final callsCtrl = Get.put((CallController()));

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    callsCtrl.getCalls();
    return SizedBox(
      height: screenHeight * 0.9,
      child: Column(
        children: [
          TopBar(),
          CallsListBuilder(
            callsList: callsCtrl.callsList,
          ),
        ],
      ),
    );
  }
}
