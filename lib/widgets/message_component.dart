import 'package:chat_web/config/config.dart';
import 'package:chat_web/models/file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MessageComponent extends StatelessWidget {
  final bool isMe, platform;
  final String message;
  final MyFile file;

  const MessageComponent(
      {Key key,
      this.isMe = false,
      this.message,
      this.file,
      this.platform = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe)
            CircleAvatar(
              radius: 12,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(Config.assets.user3),
            ),
          Row(
            children: [
              if (isMe)
                Icon(
                  FeatherIcons.moreHorizontal,
                  size: 18,
                  color: Config.colors.textColorMenu,
                ),
              Container(
                constraints: BoxConstraints(
                    maxWidth: platform ? width / 1.5 : width / 4),
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    boxShadow: [
                      if (!isMe) ...[
                        BoxShadow(
                            color: Config.colors.shadowButtonColor
                                .withOpacity(.15),
                            offset: Offset(6, 6),
                            blurRadius: 10),
                        BoxShadow(
                            color: Config.colors.shadowButtonColor
                                .withOpacity(.05),
                            offset: Offset(6, 6),
                            blurRadius: 10),
                        BoxShadow(
                            color: Config.colors.shadowButtonColor
                                .withOpacity(.15),
                            offset: Offset(6, 6),
                            blurRadius: 10),
                      ] else ...[
                        BoxShadow(
                            color: Config.colors.shadowCurrentUserChat
                                .withOpacity(.15),
                            offset: Offset(6, 6),
                            blurRadius: 10),
                        BoxShadow(
                            color: Config.colors.shadowCurrentUserChat
                                .withOpacity(0.05),
                            offset: Offset(6, 6),
                            blurRadius: 10),
                        BoxShadow(
                            color: Config.colors.shadowCurrentUserChat
                                .withOpacity(.15),
                            offset: Offset(6, 6),
                            blurRadius: 10),
                      ],
                    ],
                    gradient: isMe
                        ? null
                        : LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.bottomLeft,
                            // radius: 10,
                            colors: [
                              Config.colors.primaryColor,
                              Config.colors.primaryColor,
                              Config.colors.primaryColor.withOpacity(.5),
                            ],
                          ),
                    color: isMe ? Colors.white : Config.colors.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight:
                            isMe ? Radius.circular(0) : Radius.circular(10),
                        topLeft:
                            isMe ? Radius.circular(10) : Radius.circular(0))),
                child: Column(
                  crossAxisAlignment:
                      !isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                  children: [
                    if (message != null) ...[
                      Text(
                        message,
                        style: Config.styles.prymaryTextStyle.copyWith(
                            color: isMe
                                ? Config.colors.textColorMenu
                                : Colors.white,
                            fontSize: 13),
                      ),
                      if (file != null) ...[
                        SizedBox(
                          height: 10,
                        ),
                        FileWidget(
                          file: file,
                          isMe: isMe,
                        )
                      ]
                    ] else ...[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (!isMe) ...[
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.white.withOpacity(.5)),
                              child: Icon(
                                FeatherIcons.file,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                          Column(
                            children: [
                              Text(
                                file.name,
                                style: Config.styles.prymaryTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: !isMe
                                        ? Colors.white
                                        : Config.colors.textColorMenu),
                              ),
                              Text(
                                "${file.size} Mb",
                                style: Config.styles.prymaryTextStyle.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal,
                                    color: !isMe
                                        ? Colors.white
                                        : Config.colors.textColorMenu),
                              ),
                            ],
                          ),
                          if (isMe) ...[
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      color: Config.colors.textColorMenu),
                                  color: Colors.white.withOpacity(.5)),
                              child: Icon(
                                FeatherIcons.file,
                                size: 15,
                                color: Config.colors.textColorMenu,
                              ),
                            ),
                          ],
                        ],
                      )
                    ]
                  ],
                ),
              ),
              if (!isMe) ...[
                Icon(
                  FeatherIcons.moreHorizontal,
                  color: Config.colors.textColorMenu,
                  size: 18,
                )
              ] else ...[
                FullCheck()
              ]
            ],
          )
        ],
      ),
    );
  }
}

class FileWidget extends StatelessWidget {
  final MyFile file;
  final bool isMe;

  const FileWidget({Key key, this.file, this.isMe}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        if (isMe)
          Icon(FeatherIcons.file,
              size: 13,
              color: !isMe ? Colors.white : Config.colors.primaryColor),
        Expanded(
          flex: 2,
          child: Text("(${file.size} Mb)${file.name}",
              textAlign: isMe ? TextAlign.start : TextAlign.end,
              overflow: TextOverflow.ellipsis,
              style: Config.styles.prymaryTextStyle.copyWith(
                  fontSize: 12,
                  color: !isMe ? Colors.white : Config.colors.primaryColor)),
        ),
        if (!isMe)
          Icon(FeatherIcons.file,
              size: 13,
              color: !isMe ? Colors.white : Config.colors.primaryColor),
      ],
    );
  }
}

class FullCheck extends StatelessWidget {
  final double size;
  final bool isChecked;
  final Color checkColor1, checkColor2;
  FullCheck(
      {Key key,
      this.size = 15,
      this.isChecked = false,
      this.checkColor1,
      this.checkColor2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          FeatherIcons.check,
          size: size,
          color: checkColor1 ?? Config.colors.checkColor,
        ),
        Container(
            margin: EdgeInsets.only(left: 5),
            child: Icon(
              FeatherIcons.check,
              size: size,
              color: checkColor2 ?? Config.colors.checkColor,
            )),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  final String date;

  const CustomDivider({Key key, this.date}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
              child: Divider(
            color: Config.colors.textColorMenu.withOpacity(.15),
          )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              date,
              style: Config.styles.prymaryTextStyle.copyWith(
                  fontSize: 11,
                  color: Config.colors.textColorMenu.withOpacity(.7)),
            ),
          ),
          Expanded(
              child: Divider(
            color: Config.colors.textColorMenu.withOpacity(.15),
          )),
        ],
      ),
    );
  }
}
