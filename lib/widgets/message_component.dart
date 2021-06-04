import 'package:chat_web/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MessageComponent extends StatelessWidget {
  final bool isMe;
  final bool plateform;
  final String message;
  final MyFile myFile;
  const MessageComponent(
      {Key key,
      this.isMe = false,
      this.message,
      this.myFile,
      this.plateform = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
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
                color: Config.colors.textColorMenu,
                size: 18,
              ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              constraints: BoxConstraints(
                  maxWidth: plateform && width < 840 ? width / 1.5 : width / 4),
              decoration: BoxDecoration(
                  boxShadow: [
                    if (!isMe) ...[
                      BoxShadow(
                          color:
                              Config.colors.shadowButtonColor.withOpacity(.15),
                          offset: Offset(6, 6),
                          blurRadius: 10),
                      BoxShadow(
                          color:
                              Config.colors.shadowButtonColor.withOpacity(.05),
                          offset: Offset(6, 6),
                          blurRadius: 10),
                      BoxShadow(
                          color:
                              Config.colors.shadowButtonColor.withOpacity(.15),
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
                    ]
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: radius(10),
                      bottomRight: radius(10),
                      topRight: !isMe ? radius(10) : radius(0),
                      topLeft: !isMe ? radius(0) : radius(10)),
                  color: isMe ? Colors.white : Config.colors.primaryColor,
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
                            ])),
              child: Column(
                crossAxisAlignment:
                    !isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                children: [
                  if (message != null) ...[
                    Text(
                      message,
                      style: Config.styles.prymaryTextStyle.copyWith(
                          color:
                              isMe ? Config.colors.textColorMenu : Colors.white,
                          fontSize: 13),
                    ),
                    if (myFile != null) ...[
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: isMe
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                        children: [
                          Icon(FeatherIcons.file,
                              size: 15,
                              color: !isMe
                                  ? Colors.white
                                  : Config.colors.primaryColor),
                          Text("(${myFile.size} Mb)${myFile.title}",
                              style: Config.styles.prymaryTextStyle.copyWith(
                                  color: !isMe
                                      ? Colors.white
                                      : Config.colors.primaryColor))
                        ],
                      )
                    ]
                  ] else ...[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.25),
                              borderRadius: BorderRadius.circular(6)),
                          child: Icon(
                            FeatherIcons.file,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              myFile.title,
                              style: Config.styles.prymaryTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: !isMe
                                      ? Colors.white
                                      : Config.colors.textColorMenu),
                            ),
                            Text(
                              "${myFile.size} Mb",
                              style: Config.styles.prymaryTextStyle.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  color: !isMe
                                      ? Colors.white
                                      : Config.colors.textColorMenu),
                            ),
                          ],
                        )
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
        ),
      ],
    );
  }

  radius(double value) {
    return Radius.circular(value);
  }
}

class MyFile {
  String title;
  double size;
  MyFile({this.size, this.title});
}

class FullCheck extends StatelessWidget {
  final double size;
  final bool isChecked;
  final Color checkColor;
  FullCheck({Key key, this.size = 15, this.isChecked = false, this.checkColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          FeatherIcons.check,
          size: size,
          color: checkColor ?? Config.colors.checkColor,
        ),
        Container(
            margin: EdgeInsets.only(left: 5),
            child: Icon(
              FeatherIcons.check,
              size: size,
              color: checkColor ?? Config.colors.checkColor,
            )),
      ],
    );
  }
}
