import 'package:chat_web/config/config.dart';
import 'package:chat_web/models/msg_model_list.dart';
import 'package:chat_web/widgets/item_profil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MessageItemlist extends StatelessWidget {
  final MessageModelList msg;
  final Function onTap;
  MessageItemlist({this.msg, this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
                color: msg.isSelected
                    ? Config.colors.primaryColor
                    : Config.colors.backgroundColor1),
            color: Colors.white,
            gradient: msg.isSelected
                ? LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.bottomLeft,
                    // radius: 10,
                    colors: [
                        Config.colors.primaryColor,
                        Config.colors.primaryColor,
                        Config.colors.primaryColor.withOpacity(.5),
                      ])
                : null,
            boxShadow: [
              BoxShadow(
                  color: Config.colors.textColorMenu.withOpacity(.7),
                  offset: Offset(0, 0),
                  blurRadius: 0)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Itemprofil(
                  msgModel: msg,
                ),
                Expanded(
                    child: Text(
                  msg.time,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: Config.styles.prymaryTextStyle.copyWith(
                      fontSize: 12,
                      color: msg.isSelected
                          ? Colors.white
                          : Config.colors.textColorMenu),
                ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (msg.isVoice) ...[
                          Container(
                            margin: EdgeInsets.only(top: 2, right: 8),
                            child: Icon(
                              FeatherIcons.mic,
                              color: msg.isSelected
                                  ? Colors.white
                                  : Config.colors.textColorMenu,
                              size: 12,
                            ),
                          )
                        ],
                        Expanded(
                          child: Text(
                            msg.textMessage,
                            style: Config.styles.prymaryTextStyle.copyWith(
                                fontSize: 13,
                                color: msg.isSelected
                                    ? Colors.white
                                    : Config.colors.textColorMenu),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (msg.haveFile) ...[
                      Row(
                        children: [
                          ItemFile(
                            title: "Files(x2)",
                            icon: FeatherIcons.file,
                            color: Config.colors.primaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ItemFile(
                            title: "Photo",
                            icon: FeatherIcons.image,
                            color: Config.colors.notifColor,
                          ),
                        ],
                      )
                    ]
                  ],
                )),
                if (msg.notif != null)
                  Container(
                      margin: EdgeInsets.only(left: 6),
                      padding:
                          EdgeInsets.only(left: 5, right: 5, bottom: 6, top: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Config.colors.notifColor),
                      child: Center(
                        child: Text(
                          "${msg.notif}",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      )),
                if (msg.notif == null)
                  Container(
                    width: 20,
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ItemFile extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;

  const ItemFile({Key key, this.title, this.color, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Config.colors.primaryColor.withOpacity(.25)),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 13,
            color: color,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            "$title",
            style: Config.styles.prymaryTextStyle
                .copyWith(color: color, fontSize: 11),
          )
        ],
      ),
    );
  }
}
