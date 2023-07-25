import 'package:beomboo/Provider/ChatNotifier.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'View/ChatPage.dart';
import 'View/HomePage.dart';
void main() {
  initFirebase();
  runApp(const beomboo());
}

Future<void> initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print(":::: FireBase Init");

  final fcmToken = await FirebaseMessaging.instance.getToken();
  print(":::: fcmToken $fcmToken");

  /// 토큰 갱신시 처리되는 리스너
  FirebaseMessaging.instance.onTokenRefresh
      .listen((fcmToken) {
    // TODO: If necessary send token to application server.
    // Note: This callback is fired at each app startup and whenever a new
    // token is generated.
  })
      .onError((err) {
    // Error getting token.
  });
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
              const Text("강강강최",style: TextStyle(fontFamily: 'default',fontSize: 25,color: Colors.white),),
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
