import 'package:chat_web/config/config.dart';
import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final double radius;
  final prefix;

  const CButton(
      {Key key,
      @required this.title,
      @required this.onTap,
      this.radius = 6,
      this.prefix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Config.colors.shadowButtonColor.withOpacity(.15),
                offset: Offset(6, 6),
                blurRadius: 10),
            BoxShadow(
                color: Config.colors.shadowButtonColor.withOpacity(.05),
                offset: Offset(6, 6),
                blurRadius: 10),
            BoxShadow(
                color: Config.colors.shadowButtonColor.withOpacity(.15),
                offset: Offset(6, 6),
                blurRadius: 10),
          ],
          borderRadius: BorderRadius.circular(radius),
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.bottomLeft,
            // radius: 10,
            colors: [
              Config.colors.primaryColor,
              Config.colors.primaryColor,
              Config.colors.primaryColor.withOpacity(.5),
            ],
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefix is IconData)
              Icon(
                prefix,
                color: Colors.white,
                size: 20,
              ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: Config.styles.prymaryTextStyle.copyWith(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedBlueButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const RoundedBlueButton(
      {Key key, @required this.icon, @required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              // radius: 10,
              colors: [
                Config.colors.primaryColor.withOpacity(.5),
                Config.colors.primaryColor,
                Config.colors.primaryColor,
              ],
            ),
            borderRadius: BorderRadius.circular(50)),
        child: RawMaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: onPressed,
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ));
  }
}
