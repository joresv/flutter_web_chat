import 'package:chat_web/chat.dart';
import 'package:chat_web/menu.dart';
import 'package:chat_web/messages.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final _key = GlobalKey<ScaffoldState>();
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(width);
    return Scaffold(
      key: _key,
      drawer: width >= 999 ? null : Container(width: 250, child: Menu()),
      body: SafeArea(
        child: Scrollbar(
          controller: controller,
          child: SingleChildScrollView(
            controller: controller,
            child: Container(
              height: height,
              child: Row(
                children: [
                  // width <= 839 && width >= 839 ? 10 :
                  if (width > 869)
                    Expanded(
                      child: Menu(),
                      flex: width < 900 && width > 800 ? 4 : 3,
                    ),
                  Expanded(
                    child: Messages(
                      showMenu: width <= 999,
                      onOpenMenu: () {
                        _key.currentState.openDrawer();
                      },
                    ),
                    flex: 7,
                  ),
                  if (width >= 622)
                    Expanded(
                      child: ChatMessage(),
                      flex: width < 889 && width > 800 ? 10 : 8,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
