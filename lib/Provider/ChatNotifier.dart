import 'package:flutter/material.dart';

class ChatNotifier extends ChangeNotifier{
  TextEditingController textController          = TextEditingController();
  List<Widget>          chatMessageContent      = [];
  bool                  checkFlag               = false;

  void setMessage(messageWidget){
    chatMessageContent.add(messageWidget);
    textController.clear();
    checkFlag = !checkFlag;
    notifyListeners();
  }

  void resetChat(){
    chatMessageContent.clear();
    notifyListeners();
  }
}