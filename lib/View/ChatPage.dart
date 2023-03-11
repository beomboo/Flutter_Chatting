import 'package:beomboo/Provider/ChatNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(children: [
        ChatInputField(),
        GestureDetector(
          onTap: (){
              context.read<ChatNotifier>().resetChat();
            },
          child: Icon(Icons.forum,color: Colors.white,),
        )],
    );
  }
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
            controller: _textController,
            onSubmitted: (text){
              print("onSubmitted: ${text}");
              context.read<ChatNotifier>().setMessage(text);
              _textController.clear();
            },
            onChanged: (text){
              print("onChanged: ${text}");
            },
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
}
