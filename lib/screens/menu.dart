import 'package:chat_web/config/config.dart';
import 'package:chat_web/widgets/item_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var selectValue = MenuItemSelect.CHAT;
  onChanged(val) {
    selectValue = val;
    setState(() {});
  }

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black, offset: Offset(20, 10), blurRadius: 50)
      ]),
      child: Column(
        children: [
          Expanded(
              child: Scrollbar(
            isAlwaysShown: true,
            controller: controller,
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 50, bottom: 80),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(Config.assets.user),
                          radius: 40,
                          backgroundColor: Colors.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Henry Jabbawockiez",
                              style: Config.styles.prymaryTextStyle
                                  .copyWith(fontSize: 12.5),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 2),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Config.colors.primaryBlackColor,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  ItemMenu(
                    title: "Home",
                    groupValue: MenuItemSelect.HOME,
                    value: selectValue,
                    icon: FeatherIcons.grid,
                    onChanged: onChanged,
                  ),
                  ItemMenu(
                    title: "Chat",
                    groupValue: MenuItemSelect.CHAT,
                    value: selectValue,
                    onChanged: onChanged,
                    icon: FontAwesomeIcons.commentDots,
                  ),
                  ItemMenu(
                    title: "Contact",
                    groupValue: MenuItemSelect.CONTACT,
                    value: selectValue,
                    onChanged: onChanged,
                    icon: FeatherIcons.user,
                  ),
                  ItemMenu(
                    title: "Notification",
                    groupValue: MenuItemSelect.NOTIIFICATION,
                    value: selectValue,
                    onChanged: onChanged,
                    icon: FeatherIcons.bell,
                  ),
                  ItemMenu(
                    title: "Calendrier",
                    groupValue: MenuItemSelect.CALENDAR,
                    value: selectValue,
                    onChanged: onChanged,
                    icon: FeatherIcons.calendar,
                  ),
                  ItemMenu(
                    title: "Paramètres",
                    groupValue: MenuItemSelect.SETTINGS,
                    value: selectValue,
                    onChanged: onChanged,
                    icon: FeatherIcons.settings,
                  ),
                ],
              ),
            ),
          )),
          ItemMenu(
            title: "Déconnexion",
            groupValue: MenuItemSelect.LOGOUT,
            value: selectValue,
            onChanged: onChanged,
            icon: FeatherIcons.logOut,
          ),
        ],
      ),
    );
  }
}
