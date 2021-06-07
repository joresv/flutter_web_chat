import 'package:chat_web/config/config.dart';
import 'package:flutter/material.dart';

class ItemMenu extends StatefulWidget {
  final String title;
  final groupValue, value;
  final Function(dynamic value) onChanged;
  final IconData icon;

  const ItemMenu(
      {Key key,
      this.title,
      this.groupValue,
      this.value,
      this.onChanged,
      this.icon})
      : super(key: key);

  @override
  _ItemMenuState createState() => _ItemMenuState();
}

class _ItemMenuState extends State<ItemMenu> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.value == widget.groupValue;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: InkWell(
        onHover: (value) {
          isHover = value;
          setState(() {});
        },
        onTap: () {
          if (widget.onChanged != null) widget.onChanged(widget.groupValue);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              gradient: isHover
                  ? LinearGradient(
                      colors: [
                        Config.colors.primaryColor.withOpacity(.1),
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
                    color: isSelected
                        ? Config.colors.primaryColor
                        : Colors.transparent,
                    boxShadow: [
                      if (isSelected)
                        BoxShadow(
                            color: Config.colors.primaryColor,
                            offset: Offset(3, -1),
                            blurRadius: 5)
                    ]),
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                widget.icon,
                size: 20,
                color: isSelected
                    ? Config.colors.primaryColor
                    : Config.colors.textColorMenu,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.title,
                style: Config.styles.prymaryTextStyle
                    .copyWith(color: Config.colors.textColorMenu, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
