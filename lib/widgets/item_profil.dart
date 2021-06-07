import 'package:chat_web/config/config.dart';
import 'package:chat_web/models/msg_model_list.dart';
import 'package:chat_web/widgets/svgIcon.dart';
import 'package:flutter/material.dart';

class Itemprofil extends StatelessWidget {
  final MessageModelList msgModel;

  Itemprofil({this.msgModel});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(msgModel.profil_asset),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          margin: EdgeInsets.only(top: 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                msgModel.username,
                style: Config.styles.prymaryTextStyle
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              if (msgModel.statutMessage != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (msgModel.statut != null &&
                        msgModel.statut != StatusType.LAST_AGO) ...[
                      SvgIcon(
                          size: msgModel.statut == StatusType.WRITE ? 4 : 10,
                          color: msgModel.isSelected
                              ? Colors.white
                              : Config.colors.primaryColor,
                          asset: msgModel.statut == StatusType.RECORD
                              ? Config.assets.record
                              : Config.assets.write),
                      SizedBox(
                        width: 5,
                      )
                    ],
                    Text(
                      msgModel.statutMessage,
                      style: Config.styles.prymaryTextStyle.copyWith(
                          color: msgModel.isSelected
                              ? Colors.white
                              : Config.colors.primaryColor,
                          fontSize: 11),
                    )
                  ],
                )
            ],
          ),
        )
      ],
    );
  }
}
