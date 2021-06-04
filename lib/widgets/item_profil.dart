import 'package:chat_web/config/config.dart';
import 'package:chat_web/svgIcon.dart';
import 'package:chat_web/widgets/message_item.dart';
import 'package:flutter/material.dart';

class ItemProfil extends StatelessWidget {
  final String username, profil_asset, statutMessage;
  final bool isSelected;
  final StatusType statut;

  const ItemProfil(
      {Key key,
      this.username,
      this.profil_asset,
      this.statutMessage,
      this.isSelected = false,
      this.statut})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(profil_asset),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          margin: EdgeInsets.only(top: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                username,
                style: Config.styles.prymaryTextStyle
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              if (statutMessage != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (statut != null && statut != StatusType.LAST_AGO) ...[
                      SvgIcon(
                          size: statut == StatusType.WRITE ? 4 : 10,
                          color: isSelected
                              ? Colors.white
                              : Config.colors.primaryColor,
                          asset: statut == StatusType.RECORD
                              ? Config.assets.record
                              : Config.assets.write),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                    Text(
                      statutMessage,
                      style: Config.styles.prymaryTextStyle.copyWith(
                          color: isSelected
                              ? Colors.white
                              : Config.colors.primaryColor,
                          fontSize: 11),
                    )
                  ],
                )
            ],
          ),
        ),
      ],
    );
  }
}
