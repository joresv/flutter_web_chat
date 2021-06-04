import 'package:chat_web/config/config.dart';
import 'package:chat_web/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class CSearch extends StatefulWidget {
  @override
  _CSearchState createState() => _CSearchState();
}

class _CSearchState extends State<CSearch> {
  String selectValue = "Messages";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Config.colors.textColorMenu.withOpacity(.7),
                offset: Offset(0, 0),
                blurRadius: 0)
          ]),
      height: 50,
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
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
          CustomDropdown(
            items: ["Messages", "Voices", "Fichier"],
            value: selectValue,
            onChanged: (value) {
              print(value);
              selectValue = value;
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}
