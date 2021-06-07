import 'package:chat_web/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ChatTextField extends StatelessWidget {
  final Widget prefix, suffix;
  final hintText;

  const ChatTextField({Key key, this.prefix, this.suffix, this.hintText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (prefix != null) prefix,
        Expanded(
            child: TextFormField(
          maxLines: 5,
          minLines: 1,
          style: Config.styles.prymaryTextStyle
              .copyWith(color: Config.colors.textColorMenu),
          decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintStyle: Config.styles.prymaryTextStyle
                  .copyWith(color: Config.colors.textColorMenu.withOpacity(.5)),
              suffixIcon: Icon(FeatherIcons.smile)),
        )),
        if (suffix != null) suffix,
      ],
    );
  }
}
