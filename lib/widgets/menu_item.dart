import 'package:chat_web/svgIcon.dart';
import 'package:chat_web/config/config.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  final String title;
  final icon;
  final double size, mb;
  final value, groupValue;
  final Function(dynamic value) onChanged;
  const MenuItem(
      {Key key,
      this.icon,
      this.title,
      this.value,
      this.groupValue,
      this.size = 20,
      this.onChanged,
      this.mb = 20})
      : super(key: key);

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.value == widget.groupValue;
    // print(widget.title);
    return InkWell(
      onHover: (value) {
        isHover = value;
        setState(() {});
      },
      onTap: () {
        if (widget.onChanged != null) {
          widget.onChanged(widget.groupValue);
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: widget.mb),
        decoration: BoxDecoration(
            gradient: isHover
                ? LinearGradient(
                    colors: [
                      Config.colors.primaryColor.withOpacity(.01),
                      Colors.white
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0, 0.7])
                : null),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 2.5,
              decoration: BoxDecoration(
                  boxShadow: [
                    if (isSelected)
                      BoxShadow(
                          color: Config.colors.primaryColor,
                          offset: Offset(3, -1),
                          blurRadius: 5)
                  ],
                  color: isSelected
                      ? Config.colors.primaryColor
                      : Colors.transparent),
            ),
            SizedBox(
              width: 20,
            ),
            if (widget.icon is String)
              SvgIcon(
                asset: widget.icon,
                color: isSelected
                    ? Config.colors.primaryColor
                    : Config.colors.textColorMenu,
                size: widget.size,
              ),
            if (widget.icon is IconData)
              Icon(
                widget.icon,
                size: widget.size,
                color: isSelected
                    ? Config.colors.primaryColor
                    : Config.colors.textColorMenu,
              ),
            SizedBox(
              width: 10,
            ),
            Text(
              widget.title,
              textAlign: TextAlign.start,
              style: Config.styles.prymaryTextStyle
                  .copyWith(color: Config.colors.textColorMenu, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
