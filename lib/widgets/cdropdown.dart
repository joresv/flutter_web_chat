import 'package:chat_web/config/config.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final List<String> items;
  final Function(dynamic value) onChanded;
  final dynamic value;

  CustomDropDown({this.items, this.onChanded, this.value});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        underline: Container(),
        isDense: true,
        onChanged: (e) {
          if (onChanded != null) onChanded(e);
        },
        icon: Icon(
          Icons.keyboard_arrow_down_outlined,
          color: Config.colors.textColorMenu,
        ),
        hint: Text(value,
            style: Config.styles.prymaryTextStyle
                .copyWith(color: Config.colors.textColorMenu)),
        items: items
            .map((e) => DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                  style: Config.styles.prymaryTextStyle
                      .copyWith(color: Config.colors.textColorMenu),
                )))
            .toList());
  }
}
