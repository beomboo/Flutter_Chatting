import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../firebase_options.dart';

class FireBaseCore {
  FireBaseCore(){
    initFirebase();
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
    })
        .onError((err) {
    });
  }
}