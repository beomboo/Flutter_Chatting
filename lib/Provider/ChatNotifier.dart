import 'package:flutter/material.dart';

class ChatNotifier extends ChangeNotifier{
  List<Widget>          chatMessageContent      = [];
  int                   chatMessageLength       = 0;

  void setMessage(messageWidget){
    chatMessageContent.add(messageWidget);
    chatMessageLength = chatMessageContent.length;
    notifyListeners();
  }

  void resetChat(){
    chatMessageContent.clear();
    notifyListeners();
  }
}