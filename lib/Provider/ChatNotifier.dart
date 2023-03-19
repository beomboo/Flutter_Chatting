import 'package:flutter/material.dart';

class ChatNotifier extends ChangeNotifier{
  TextEditingController textController          = TextEditingController();
  List<Widget>          chatMessageContent      = [];
  int                   chatMessageLength       = 0;

  void setMessage(messageWidget){
    chatMessageContent.add(messageWidget);
    chatMessageLength = chatMessageContent.length;
    textController.clear();
    notifyListeners();
  }

  void resetChat(){
    chatMessageContent.clear();
    notifyListeners();
  }
}