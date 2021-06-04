import 'package:chat_web/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final Function(dynamic value) onChanged;
  final dynamic value;

  const CustomDropdown(
      {Key key, @required this.items, this.onChanged, this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      selectedItemBuilder: (c) {
        return items.map((e) => Text(e)).toList();
      },
      isDense: true,
      items: items
          .map((e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ))
          .toList(),
      underline: Container(),
      icon: Icon(Icons.keyboard_arrow_down_rounded),
      hint: Text(
        value,
        style: Config.styles.prymaryTextStyle
            .copyWith(color: Config.colors.textColorMenu),
      ),
      onChanged: (value) {
        if (onChanged != null) onChanged(value);
      },
    );
  }
}
