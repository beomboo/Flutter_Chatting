import 'package:beomboo/Provider/ChatNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ChatPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double widgetHeight = MediaQuery.of(context).size.height * 0.2;
    double widgetWidth  = MediaQuery.of(context).size.width;
    return Container(
      width: widgetWidth,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          WebView(
            initialUrl: 'https://www.genie.co.kr/detail/artistInfo?xxnm=79678096',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
          )
        ],),
      ),
    );
  }
}
