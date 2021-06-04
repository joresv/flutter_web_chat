import 'package:chat_web/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatTextFiels extends StatelessWidget {
  final Widget prefix, suffix;
  final int minLines, maxLines;
  final String hintText;

  const ChatTextFiels(
      {Key key,
      this.prefix,
      this.minLines,
      this.maxLines,
      this.hintText,
      this.suffix})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (prefix != null) prefix,
        Expanded(
            child: TextField(
          maxLines: maxLines,
          minLines: minLines,
          style: Config.styles.prymaryTextStyle
              .copyWith(color: Config.colors.textColorMenu),
          decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintStyle: Config.styles.prymaryTextStyle
                  .copyWith(color: Config.colors.textColorMenu.withOpacity(.5)),
              suffixIcon: Icon(FeatherIcons.smile)),
        )),
        if (suffix != null) suffix
      ],
    );
  }
}
