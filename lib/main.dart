import 'package:beomboo/Provider/ChatNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'View/ChatPage.dart';
import 'View/HomePage.dart';
void main() {
  runApp(const beomboo());
}

class beomboo extends StatelessWidget {
  const beomboo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ ChangeNotifierProvider(create: (_)=> ChatNotifier()) ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: beombooPage(),
      ),
    );
  }
}

class beombooPage extends StatefulWidget {
  const beombooPage({Key? key}) : super(key: key);

  @override
  State<beombooPage> createState() => _beombooPageState();
}

class _beombooPageState extends State<beombooPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amberAccent,
        title: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Beomboo",style: TextStyle(fontFamily: 'default',fontSize: 25),),
              IconButton(
               onPressed: (){ Navigator.push(context,MaterialPageRoute(builder: (context) => ChatPage()));},
                 icon: Container(width: 30, height: 30,decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.red),
                   child: Center(child: Text(context.select((ChatNotifier notifier) => notifier.chatMessageLength.toString()),style: TextStyle(fontFamily: 'default',fontSize: 15,color: Colors.white)),
                   )))
          ])),
      body: HomePage(),
    );
  }
}
