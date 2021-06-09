import 'package:chat_web/screens/chat.dart';
import 'package:chat_web/screens/list_chat.dart';
import 'package:chat_web/screens/menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(width);
    return Scaffold(
      key: _key,
      drawer: width > 900
          ? null
          : Container(
              width: 250,
              child: Menu(),
            ),
      body: SafeArea(
          child: Container(
        height: height,
        child: Row(
          children: [
            if (width > 900) Expanded(flex: 3, child: Menu()),
            Expanded(
                flex: 7,
                child: ListChat(
                  onOpenMenu: width > 900
                      ? null
                      : () {
                          _key.currentState.openDrawer();
                        },
                )),
            if (width > 681) Expanded(flex: 8, child: ChatMessage()),
          ],
        ),
      )),
    );
  }
}
