import 'dart:math';

import 'package:flutter/material.dart';

class ChatNotifier extends ChangeNotifier{
  String TAG = "[ChatNotifier]";
  List<Widget> chatMessageContent = [];

  void setMessage(message){
    var rnd = Random().nextInt(999) + 1;
    chatMessageContent.add(ChatContent(rnd, message));
    notifyListeners();
  }

  void resetChat(){
    chatMessageContent.clear();
    notifyListeners();
  }

  Widget ChatContent(id, message){
    String userIndex = id.toString();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: id % 2 == 1 ?  CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          RichText( // 프로필 사진 & 아이디
              text: TextSpan(
                  children: [
                    WidgetSpan(child: Icon(Icons.account_circle)),
                    TextSpan(
                        text: userIndex,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        )
                    )
                  ]
              )
          ),
          Text(message) // 채팅 내용
        ],
      ),
    );
  }
}