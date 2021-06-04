import 'package:flutter/material.dart';

class Config {
  static final assets = _Asset();
  static final colors = _Color();
  static final styles = _Style();
}

class _Asset {
  final message = "assets/icons/msg.svg";
  final home = "assets/icons/appli.svg";
  final contact = "assets/icons/user.svg";
  final notification = "assets/icons/notif.svg";
  final calendar = "assets/icons/calendar.svg";
  final settings = "assets/icons/setting.svg";
  final arrow_down = "assets/icons/arrow_down.svg";
  final signOut = "assets/icons/log_out.svg";
  final write = "assets/icons/write.svg";
  final record = "assets/icons/record.svg";
  final user = "assets/images/profil.png";
  final user1 = "assets/images/Dog_1.png";
  final user2 = "assets/images/Dog_2.png";
  final user3 = "assets/images/Dog_3.png";
  final user4 = "assets/images/Dog_4.png";
}

class _Color {
  final primaryColor = Color(0xFF2A8BF2);
  final primaryBlackColor = Color(0xFF0D1C2E);
  final textColorMenu = Color(0xFF707C97);
  final backgroundColor1 = Color(0xFFF3F3FB);
  final backgroundColor2 = Color(0xFFFDFBFD);
  final notifColor = Color(0xFFFF3366);
  final backgroundHeaderChat = Color(0xFFFAFBFF);
  final backgroundFile = Color(0xFF231F20);
  final checkColor = Color(0xFFB7BDCB);
  final shadowButtonColor = Color.fromRGBO(42, 139, 242, 1);
  final shadowCurrentUserChat = Color.fromRGBO(112, 124, 151, 1);
  final dividerColor = Color.fromRGBO(112, 124, 151, 0.1);
}

class _Style {
  final prymaryTextStyle = TextStyle(
      color: Config.colors.primaryBlackColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal);
}

enum MenuItemSelect { HOME, CHAT, CONTACT, NOTIIFICATION, CALENDAR, SETTINGS }
