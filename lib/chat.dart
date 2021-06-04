import 'package:chat_web/config/config.dart';
import 'package:chat_web/widgets/button.dart';
import 'package:chat_web/widgets/chat_textfield.dart';
import 'package:chat_web/widgets/custom_divider.dart';
import 'package:chat_web/widgets/item_profil.dart';
import 'package:chat_web/widgets/message_component.dart';
import 'package:chat_web/widgets/message_item.dart';
import 'package:chat_web/widgets/rounded_button.dart';
import 'package:chat_web/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ChatMessage extends StatelessWidget {
  final bool plateform;

  ChatMessage({Key key, this.plateform = false}) : super(key: key);

  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: !plateform
              ? EdgeInsets.only(left: 5, top: 50, bottom: 25, right: 15)
              : EdgeInsets.zero,
          child: Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Config.colors.textColorMenu.withOpacity(.2),
                  blurRadius: 5,
                  // spreadRadius: 5,
                  offset: Offset(0, 0))
            ]),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(plateform ? 10 : 35, 20, 30, 15),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Config.colors.dividerColor))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (plateform)
                            InkWell(
                                onTap: () => Navigator.of(context).pop(),
                                child: Icon(Icons.arrow_back)),
                          ItemProfil(
                            username: "Harold Beranger",
                            statutMessage: "last online 5 hours ago",
                            statut: StatusType.LAST_AGO,
                            profil_asset: Config.assets.user3,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          RoundedButton(
                              icon: FeatherIcons.paperclip, onPressed: () {}),
                          SizedBox(
                            width: 15,
                          ),
                          RoundedButton(
                              icon: FeatherIcons.moreVertical,
                              onPressed: () {}),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Scrollbar(
                    isAlwaysShown: true,
                    controller: controller,
                    child: SingleChildScrollView(
                      controller: controller,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(40, 20, 30, 0),
                        child: Column(
                          children: [
                            MessageComponent(
                              plateform: plateform,
                              message:
                                  "Hello OnProgramme! Finally found the time to write to you) I need your help in creating interactive animations for my mobile application.",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            MessageComponent(
                              plateform: plateform,
                              message: "Can I send you files?",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            MessageComponent(
                              plateform: plateform,
                              message: "Hey! Okay, send out.",
                              isMe: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            MessageComponent(
                              plateform: plateform,
                              myFile: MyFile(size: 41.36, title: "Style.zip"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomDivider(
                              title: "3 day ago",
                            ),
                            MessageComponent(
                              plateform: plateform,
                              isMe: true,
                              message:
                                  "Hello! I tweaked everything you asked. I am sending the finished file",
                              myFile:
                                  MyFile(size: 41.36, title: " New_Style.zip"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            MessageComponent(
                              plateform: plateform,
                              message:
                                  "Hello OnProgramme! Finally found the time to write to you) I need your help in creating interactive animations for my mobile application.",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 40, bottom: 10, right: 30),
                  child: Column(
                    children: [
                      Divider(
                        color: Config.colors.textColorMenu.withOpacity(.15),
                      ),
                      ChatTextFiels(
                        minLines: 1,
                        maxLines: 5,
                        prefix: RoundedBlueButton(
                          icon: Icons.add,
                          onPressed: () {},
                        ),
                        hintText: "Type a message here",
                        suffix: RoundedBlueButton(
                          icon: FeatherIcons.send,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
