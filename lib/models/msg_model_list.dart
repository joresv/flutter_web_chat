class MessageModelList {
  String statutMessage;
  String username, profil_asset, time;
  StatusType statut;
  String textMessage;
  bool haveFile;
  bool isVoice;
  int notif;
  bool isSelected;

  MessageModelList(
      {this.haveFile = false,
      this.isSelected = false,
      this.isVoice = false,
      this.notif,
      this.profil_asset,
      this.statut,
      this.statutMessage,
      this.textMessage,
      this.time,
      this.username});
}

enum StatusType { RECORD, WRITE, LAST_AGO }
