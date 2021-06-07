import 'package:chat_web/config/config.dart';
import 'package:chat_web/widgets/cdropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class CustomSearch extends StatefulWidget {
  @override
  _CustomSearchState createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  String value = "Messages";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Config.colors.textColorMenu.withOpacity(.7),
                offset: Offset(0, 0),
                blurRadius: 0)
          ]),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            style: Config.styles.prymaryTextStyle
                .copyWith(color: Config.colors.textColorMenu),
            decoration: InputDecoration(
                prefixIcon: Icon(
                  FeatherIcons.search,
                  size: 20,
                ),
                hintStyle: Config.styles.prymaryTextStyle
                    .copyWith(color: Config.colors.textColorMenu),
                hintText: "Search",
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          )),
          CustomDropDown(
              items: ["Messages", "Voices", "Files"],
              onChanded: (e) {
                value = e;
                setState(() {});
              },
              value: value)
        ],
      ),
    );
  }
}
