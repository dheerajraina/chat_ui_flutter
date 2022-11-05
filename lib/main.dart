import 'dart:ffi';

import 'package:chat_ui_flutter/config/pallete.dart';
import 'package:chat_ui_flutter/pages/profile/view/view.dart';
import 'package:chat_ui_flutter/pages/calls/view/view.dart';
import 'package:flutter/material.dart';

import 'package:chat_ui_flutter/pages/chat/view/view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: const ColorScheme.dark(
          primary: Color.fromARGB(255, 2, 2, 2),
          onPrimary: Colors.black,
          secondary: Color.fromARGB(255, 33, 142, 243),
          onSecondary: Colors.black,
          background: Color.fromARGB(255, 0, 0, 0),
          onBackground: Colors.white,
          surface: Color.fromARGB(255, 0, 0, 0),
          onSurface: Colors.white,
        )),
        home: const MainApp());
  }
}

class MainAppController {
  RxInt _currentNavIndex = 0.obs;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(MainAppController());

    List<Widget> screens = [
      ChatPage(),
      CallsPage(),
      ProfilePage(),
    ];
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Obx((() => screens[_controller._currentNavIndex.value])),
        bottomNavigationBar: Obx(
          () {
            return BottomNavigationBar(
              backgroundColor: Colors.black,
              selectedItemColor: Pallete.lightBlue,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.chat_bubble), label: 'Chat'),
                BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Call'),
                // BottomNavigationBarItem(icon: Icon(Icons.face), label: 'Profile'),
              ],
              currentIndex: _controller._currentNavIndex.value,
              onTap: (int tappedIndex) {
                _controller._currentNavIndex.value = tappedIndex;
              },
            );
          },
        ));
  }
}
