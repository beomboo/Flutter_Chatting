import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

// https://box-world.tistory.com/75

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const beomboo());
}

class beomboo extends StatelessWidget {
  const beomboo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: beombooPage(),
    );
  }
}

class beombooPage extends StatefulWidget {
  const beombooPage({Key? key}) : super(key: key);

  @override
  State<beombooPage> createState() => _beombooPageState();
}

/// 비동기 처리
// 비동기 통신 및 처리 함수가 완료되면 then 을 통해서 다음 작업으로 넘어 갈 수 있음
Future<void> futureTest() async{
  print("[BBE] futureTest Click");
  Future.delayed(Duration(seconds: 5),(){
    return "Future";
  }).then((value){
    print("[BBE] Future success : "+value);
  }).catchError((onError){
    print("[BBE] Future error : "+onError);
  });
}

class _beombooPageState extends State<beombooPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialization();
  }
  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BeomBoo",style: TextStyle(fontSize: 25),),
                IconButton(onPressed: (){}, icon: Icon(Icons.add_alert))
              ])),
        body: Container(
          decoration: BoxDecoration(color: Colors.amber),
          child: Column(
            children: [
              Flexible(
                child: Padding(padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                    child: IconButton(onPressed: (){futureTest();}, icon: Icon(Icons.start),)
                  ))),
              Flexible(
                flex: 3,
                child: Padding(padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                  )))
            ],
          ),
        ),
      ),
    );
  }
}
