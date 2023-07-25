import 'dart:math';

import 'package:beomboo/Provider/ChatNotifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                decoration: const BoxDecoration(color: Colors.amber),
                child: Padding(padding: const EdgeInsets.only(left: 10,bottom: 10,right: 10),
                    child: Column(children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            const Align(alignment: Alignment.center, child: Text("Chatting",style: TextStyle(fontFamily: 'default',fontSize: 25, color: Colors.white))),
                            Align(alignment:Alignment.centerLeft, child: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back_ios,color: Colors.white,))),
                          ],),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Selector<ChatNotifier, Tuple2<List<Widget>, int>>(
                              selector: (_, state) => Tuple2(state.chatMessageContent, state.chatMessageLength),
                              builder: (context, data, widget){
                                return SingleChildScrollView(child: Column(children: data.item1),);}))),
                        Padding(padding:EdgeInsets.only(top: 8.0),
                          child: Row(children: [
                              ChatInputField(),
                              GestureDetector(
                                onTap: (){context.read<ChatNotifier>().resetChat();},
                                child: Icon(Icons.forum,color: Colors.white,),)],),),
    ],),)),));
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
            controller: textController,
            onSubmitted: (text) {
              context.read<ChatNotifier>().setMessage(ChatContent(text));
              textController.clear();
              FirebaseFirestore.instance
                  .collection('message')
                  .add({'id': '123', 'msg': text}).then((DocumentReference doc) => print('${doc.id}'));
                  // .doc('HTeahIu9rs2HhM69K0u8')
                  // .set({'id': '123', 'msg': text});
            },
            onChanged: (text){},
            style: TextStyle(fontFamily: 'default',fontSize: 14.0, color: Colors.black45),
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
    return Padding(padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: rnd % 2 == 1 ?  MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          Column(children: [
            Row(children: [
              Icon(Icons.account_circle),
              Padding(padding: EdgeInsets.only(left: 5)),
              Text(userIndex,style: TextStyle(fontFamily: 'default',fontSize: 20,color: Colors.black),)
            ],),
            Text(message, style: TextStyle(fontFamily: 'default'),)],),
    ],),);
  }
}
