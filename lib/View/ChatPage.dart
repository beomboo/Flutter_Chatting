import 'dart:math';

import 'package:beomboo/Provider/ChatNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Chatting",style: TextStyle(fontSize: 25),),
                IconButton(onPressed: (){}, icon: Icon(Icons.chat))
              ])),
      body: Container(
          decoration: const BoxDecoration(color: Colors.amber),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: CustomScrollView(
                        slivers: [
                          SliverList(delegate: SliverChildListDelegate(
                              context.select((ChatNotifier notifier) => notifier.chatMessageContent)
                          ))],
                      ))),
                Padding(
                  padding:EdgeInsets.only(top: 8.0),
                  child: Row(children: [
                      ChatInputField(),
                      GestureDetector(
                        onTap: (){
                          context.read<ChatNotifier>().resetChat();
                        },
                        child: Icon(Icons.forum,color: Colors.white,),
                      )
                  ],),
                ),
              ],
            ),
          )),
    );
  }

  /// 입력창
  Widget ChatInputField(){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: TextField(
            controller: context.read<ChatNotifier>().textController,
            onSubmitted: (text) {
              print("onSubmitted: ${text}");
              context.read<ChatNotifier>().setMessage(ChatContent(text));
            },
            onChanged: (text){},
            style: TextStyle(fontSize: 14.0, color: Colors.black45),
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 10.0)
            ),
          ),
        ),
      ),
    );
  }

  /// 채팅내용
  Widget ChatContent(message){
    var rnd = Random().nextInt(999);
    String userIndex = rnd.toString();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: rnd % 2 == 1 ?  CrossAxisAlignment.start : CrossAxisAlignment.end,
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
