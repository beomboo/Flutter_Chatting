import 'dart:math';

import 'package:flutter/material.dart';

class ChatNotifier extends ChangeNotifier{
  String TAG = "[ChatNotifier]";
  List<Widget> chatMessageContet = [];

  void setMessage(message){
    var rnd = Random().nextInt(45) + 1;
    chatMessageContet.add(ChatContent(rnd.toString(), message));
    print("${TAG} chatMessageContet : ${chatMessageContet.length}");
    notifyListeners();
  }

  void resetChat(){
    chatMessageContet.clear();
    notifyListeners();
  }

  Widget ChatContent(id, message){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText( // 프로필 사진 & 아이디
              text: TextSpan(
                  children: [
                    WidgetSpan(child: Icon(Icons.account_circle)),
                    TextSpan(
                        text: id,
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