import 'package:chat_web/svgIcon.dart';
import 'package:chat_web/config/config.dart';
import 'package:chat_web/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Menu extends StatefulWidget {
  final Function(int value) selectItems;

  const Menu({Key key, this.selectItems}) : super(key: key);
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  MenuItemSelect selectItem = MenuItemSelect.HOME;

  void changeValue(value) {
    selectItem = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black,
            offset: Offset(20, 10),
            // spreadRadius: 10,
            blurRadius: 50),
      ]),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(top: 50, bottom: 40),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          backgroundImage: AssetImage(Config.assets.user),
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
                              child: SvgIcon(
                                asset: Config.assets.arrow_down,
                                color: Config.colors.primaryBlackColor,
                                size: 15,
                              ),
                            )
                          ],
                        )
                      ],
                    )),
                MenuItem(
                  title: "Home",
                  groupValue: MenuItemSelect.HOME,
                  value: selectItem,
                  onChanged: changeValue,
                  icon: FeatherIcons.grid,
                ),
                MenuItem(
                  title: "Chat",
                  groupValue: MenuItemSelect.CHAT,
                  value: selectItem,
                  onChanged: changeValue,
                  icon: FontAwesomeIcons.commentDots,
                ),
                MenuItem(
                  title: "Contact",
                  groupValue: MenuItemSelect.CONTACT,
                  value: selectItem,
                  onChanged: changeValue,
                  icon: FeatherIcons.user,
                ),
                MenuItem(
                  title: "Notification",
                  groupValue: MenuItemSelect.NOTIIFICATION,
                  value: selectItem,
                  onChanged: changeValue,
                  icon: FeatherIcons.bell,
                ),
                MenuItem(
                  title: "Calendrier",
                  groupValue: MenuItemSelect.CALENDAR,
                  value: selectItem,
                  onChanged: changeValue,
                  icon: FeatherIcons.calendar,
                ),
                MenuItem(
                  title: "Paramètres",
                  groupValue: MenuItemSelect.SETTINGS,
                  value: selectItem,
                  onChanged: changeValue,
                  icon: FeatherIcons.settings,
                ),
              ],
            ),
          ),
          MenuItem(
            title: "Déconnexion",
            groupValue: MenuItemSelect.SETTINGS,
            value: selectItem,
            onChanged: changeValue,
            icon: FeatherIcons.power,
          ),
        ],
      ),
    );
  }
}
