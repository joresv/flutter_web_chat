import 'package:chat_web/config/config.dart';
import 'package:chat_web/models/file.dart';
import 'package:chat_web/models/msg_model_list.dart';
import 'package:chat_web/widgets/button.dart';
import 'package:chat_web/widgets/chat_text_field.dart';
import 'package:chat_web/widgets/item_profil.dart';
import 'package:chat_web/widgets/message_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ChatMessage extends StatelessWidget {
  var controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width <= 681;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: isMobile
              ? EdgeInsets.zero
              : EdgeInsets.only(top: 50, left: 5, right: 15, bottom: 25),
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
                  padding: EdgeInsets.fromLTRB(isMobile ? 10 : 35, 20, 30, 15),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Config.colors.dividerColor))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (isMobile)
                        InkWell(
                          child: Icon(Icons.arrow_back),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      Itemprofil(
                        msgModel: MessageModelList(
                          username: "Harold Beranger",
                          statutMessage: "last online 5 hours ago",
                          statut: StatusType.LAST_AGO,
                          profil_asset: Config.assets.user3,
                        ),
                      ),
                      Expanded(child: Container()),
                      RBtn(
                        icon: FeatherIcons.paperclip,
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      RBtn(
                        icon: FeatherIcons.moreVertical,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Scrollbar(
                  controller: controller,
                  isAlwaysShown: true,
                  child: SingleChildScrollView(
                    controller: controller,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(40, 20, 30, 0),
                      child: Column(
                        children: [
                          MessageComponent(
                            message:
                                "Hello OnProgramme! Finally found the time to write to you) I need your help in creating interactive animations for my mobile application.",
                          ),
                          MessageComponent(
                            message: "Can I send you files?",
                          ),
                          MessageComponent(
                            message: "Hey! Okay, send out.",
                            isMe: true,
                          ),
                          MessageComponent(
                            file: MyFile(size: 41.36, name: "Style.zip"),
                          ),
                          CustomDivider(
                            date: "3 days ago",
                          ),
                          MessageComponent(
                            isMe: true,
                            message:
                                "Hello! I tweaked everything you asked. I am sending the finished file",
                            file: MyFile(size: 41.36, name: " New_Style.zip"),
                          ),
                          MessageComponent(
                            isMe: true,
                            message:
                                "Hello OnProgramme! Finally found the time to write to you) I need your help in creating interactive animations for my mobile application.",
                          ),
                          MessageComponent(
                            message:
                                "Hello! I tweaked everything you asked. I am sending the finished file",
                            file: MyFile(size: 41.36, name: " New_Style.zip"),
                          ),
                          MessageComponent(
                            isMe: true,
                            file: MyFile(size: 41.36, name: "Style.zip"),
                          ),
                          MessageComponent(
                            message: "Salut moi c'est jores et toi",
                            isMe: true,
                          ),
                          MessageComponent(
                            isMe: true,
                            message:
                                "Hello OnProgramme! Finally found the time to write to you) I need your help in creating interactive animations for my mobile application.",
                          ),
                          MessageComponent(
                            message:
                                "Hello! I tweaked everything you asked. I am sending the finished file",
                            file: MyFile(size: 41.36, name: " New_Style.zip"),
                          ),
                          MessageComponent(
                            message: "Salut moi c'est jores et toi",
                            isMe: true,
                          ),
                          MessageComponent(
                            message:
                                "Hello! I tweaked everything you asked. I am sending the finished file",
                            file: MyFile(size: 41.36, name: " New_Style.zip"),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(left: 40, bottom: 10, right: 30),
                  child: ChatTextField(
                    prefix: RBtn2(
                      icon: Icons.add,
                      onPressed: () {},
                    ),
                    suffix: RBtn2(
                      icon: FeatherIcons.send,
                      onPressed: () {},
                    ),
                    hintText: "Type a message here",
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
