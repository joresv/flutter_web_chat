import 'package:chat_web/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const RoundedButton({Key key, @required this.icon, @required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Config.colors.textColorMenu,
      borderRadius: BorderRadius.circular(30),
      elevation: 5,
      // shape: RoundedRectangleBorder(),
      color: Colors.white,
      child: InkWell(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Config.colors.textColorMenu,
            size: 13,
          ),
        ),
      ),
    );
  }
}
