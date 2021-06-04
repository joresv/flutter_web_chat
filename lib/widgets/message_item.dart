import 'package:chat_web/config/config.dart';
import 'package:chat_web/svgIcon.dart';
import 'package:chat_web/widgets/item_profil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MessageItem extends StatelessWidget {
  final String statutMessage;
  final String username, profil_asset, time;
  final StatusType statut;
  final String textMessage;
  final bool haveFile;
  final bool isVoice;
  final int notif;
  final bool isSelected;
  final Function onTap;

  const MessageItem(
      {Key key,
      this.statutMessage,
      this.username,
      this.statut,
      this.profil_asset,
      this.time,
      this.textMessage,
      this.haveFile = false,
      this.isVoice = false,
      this.notif,
      this.isSelected = false,
      this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
                color: isSelected
                    ? Config.colors.primaryColor
                    : Config.colors.backgroundColor1),
            color: Colors.white,
            gradient: isSelected
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemProfil(
                  isSelected: isSelected,
                  profil_asset: profil_asset,
                  statut: statut,
                  statutMessage: statutMessage,
                  username: username,
                ),
                Expanded(
                  child: Text(
                    time,
                    overflow: TextOverflow.ellipsis,
                    style: Config.styles.prymaryTextStyle.copyWith(
                        fontSize: 12,
                        color: isSelected
                            ? Colors.white
                            : Config.colors.textColorMenu),
                  ),
                ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isVoice) ...[
                            Container(
                              margin: EdgeInsets.only(top: 2, right: 8),
                              child: Icon(
                                FeatherIcons.mic,
                                color: isSelected
                                    ? Colors.white
                                    : Config.colors.textColorMenu,
                                size: 12,
                              ),
                            )
                          ],
                          Expanded(
                            child: Text(
                              textMessage,
                              style: Config.styles.prymaryTextStyle.copyWith(
                                  fontSize: 13,
                                  color: isSelected
                                      ? Colors.white
                                      : Config.colors.textColorMenu),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (haveFile)
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Config.colors.primaryColor
                                      .withOpacity(.25)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    FeatherIcons.file,
                                    size: 13,
                                    color: Config.colors.primaryColor,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "Files (x2)",
                                    style: Config.styles.prymaryTextStyle
                                        .copyWith(
                                            color: Config.colors.primaryColor,
                                            fontSize: 11),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Config.colors.notifColor
                                      .withOpacity(.25)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    FeatherIcons.image,
                                    size: 13,
                                    color: Config.colors.notifColor,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "Photo",
                                    style: Config.styles.prymaryTextStyle
                                        .copyWith(
                                            color: Config.colors.notifColor,
                                            fontSize: 11),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                ),
                if (notif != null)
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
                        "$notif",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
                if (notif == null)
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

enum StatusType { RECORD, WRITE, LAST_AGO }
