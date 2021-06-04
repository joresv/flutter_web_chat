import 'package:chat_web/config/config.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final String title;

  const CustomDivider({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
              child: Divider(
            color: Config.colors.textColorMenu.withOpacity(.15),
          )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              title,
              style: Config.styles.prymaryTextStyle.copyWith(
                  fontSize: 11,
                  color: Config.colors.textColorMenu.withOpacity(.7)),
            ),
          ),
          Expanded(
              child: Divider(
            color: Config.colors.textColorMenu.withOpacity(.15),
          )),
        ],
      ),
    );
  }
}
