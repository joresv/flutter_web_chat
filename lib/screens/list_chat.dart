import 'package:chat_web/config/config.dart';
import 'package:chat_web/models/msg_model_list.dart';
import 'package:chat_web/screens/chat.dart';
import 'package:chat_web/widgets/button.dart';
import 'package:chat_web/widgets/cdropdown.dart';
import 'package:chat_web/widgets/csearch.dart';
import 'package:chat_web/widgets/msg_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ListChat extends StatefulWidget {
  final Function onOpenMenu;

  const ListChat({Key key, this.onOpenMenu}) : super(key: key);
  @override
  _ListChatState createState() => _ListChatState();
}

class _ListChatState extends State<ListChat> {
  String recentValue = "Recent Message";
  var controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Config.colors.backgroundColor1,
                  Config.colors.backgroundColor2,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0, .2]),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 50, left: 25, right: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Chats",
                              style: Config.styles.prymaryTextStyle.copyWith(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            CustomDropDown(
                                items: ["Recent Message", "Old Message"],
                                onChanded: (e) {
                                  recentValue = e;
                                  setState(() {});
                                },
                                value: recentValue)
                          ],
                        ),
                        CustomButton(
                          title: "New Chat",
                          prefix: Icons.add,
                          onTap: () {},
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomSearch(),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Center(
                child: Scrollbar(
                  isAlwaysShown: true,
                  controller: controller,
                  child: SingleChildScrollView(
                    controller: controller,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          MessageItemlist(
                            onTap: () {
                              if (width <= 681)
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => ChatMessage()));
                            },
                            msg: MessageModelList(
                                statut: StatusType.WRITE,
                                username: "OnProgramme",
                                statutMessage: "writes",
                                notif: 4,
                                time: "1 minute ago",
                                profil_asset: Config.assets.user1,
                                textMessage:
                                    "Most of its text is made up from sections 1.10.32–3 of Cicero's De finibus bonorum et malorum (On the Boundaries of Goods and Evils; finibus may also be translated as purposes)."),
                          ),
                          MessageItemlist(
                            msg: MessageModelList(
                                statut: StatusType.RECORD,
                                isVoice: true,
                                haveFile: true,
                                notif: 2,
                                username: "OnProgramme",
                                statutMessage: "records voice message",
                                time: "1 minute ago",
                                profil_asset: Config.assets.user2,
                                textMessage: "Voice message (01:15)"),
                          ),
                          MessageItemlist(
                            msg: MessageModelList(
                                statut: StatusType.RECORD,
                                isSelected: true,
                                username: "Harold Beranger",
                                statutMessage: "last online 5 hours ago",
                                time: "3 days ago",
                                profil_asset: Config.assets.user3,
                                textMessage:
                                    "Cicero famously orated against his political opponent Lucius Sergius Catilina."),
                          ),
                          MessageItemlist(
                            msg: MessageModelList(
                              profil_asset: Config.assets.user4,
                              notif: 2,
                              statut: StatusType.LAST_AGO,
                              username: "Aurore Belvine",
                              statutMessage: "last online 5 hours ago",
                              time: "3 days ago",
                              textMessage:
                                  "Most of its text is made up from sections 1.10.32–3 of Cicero's De finibus bonorum et malorum (On the Boundaries of Goods and Evils; finibus may also be translated as purposes).",
                            ),
                          ),
                          MessageItemlist(
                            msg: MessageModelList(
                                statut: StatusType.RECORD,
                                isVoice: true,
                                haveFile: true,
                                notif: 2,
                                username: "OnProgramme",
                                statutMessage: "records voice message",
                                time: "1 minute ago",
                                profil_asset: Config.assets.user2,
                                textMessage: "Voice message (01:15)"),
                          ),
                          MessageItemlist(
                            msg: MessageModelList(
                                statut: StatusType.WRITE,
                                username: "OnProgramme",
                                statutMessage: "writes",
                                notif: 4,
                                time: "1 minute ago",
                                profil_asset: Config.assets.user1,
                                textMessage:
                                    "Most of its text is made up from sections 1.10.32–3 of Cicero's De finibus bonorum et malorum (On the Boundaries of Goods and Evils; finibus may also be translated as purposes)."),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
        if (widget.onOpenMenu != null)
          Container(
            margin: EdgeInsets.only(left: 25, top: 20),
            child: InkWell(
              child: Icon(
                FeatherIcons.menu,
                size: 30,
              ),
              onTap: widget.onOpenMenu,
            ),
          )
      ],
    );
  }
}
