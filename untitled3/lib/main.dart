import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Completer<WebViewController> _controller = Completer<WebViewController>();
  FlutterWebviewPlugin _flutterWebviewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _flutterWebviewPlugin.onStateChanged.listen((event) {
      print("event.state ${event.type}, ${event.url}, ${event.navigationType}");

    });
    _flutterWebviewPlugin.onHttpError.listen((event) {
      print("event.error ${event.code}, ${event.url}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:

        WebviewScaffold(
            key: UniqueKey(),
            hidden: true,
            // url: "https://pub.dev",
          // "https://hst.netr.jp/op_m/?key=LdYUdyu2&mid=12&sv=11456&sku=4971633002005_4971633002006_4971633002099_4971633002098"
          //   "https://hst.netr.jp/open/index.php?key=LdYUdyu2&mid=12&sv=11456&sku=4971633002005_4971633002006_4971633002099_4971633002098",
          useWideViewPort: true,
          url :"https://hst.netr.jp/open/index.php?key=LdYUdyu2&mid=&sv=11456&sku=4971633002005_4971633002006_4971633002099_4971633002098"
          // "https://hst.netr.jp/open/index.php?key=LdYUdyu2&mid=122&sv=11456&sku=4971633002005_4971633002006_4971633002099_4971633002098"
          // "https://hst.netr.jp/op_m/?key=LdYUdyu2&mid=122&sv=11456&sku=4971633002005_4971633002006_4971633002099_4971633002098",
        ),
        // SizedBox(
        //   width: double.infinity,ke
        //   height: MediaQuery.of(context).size.height,
        //   child: WebView(
        //     javascriptMode: JavascriptMode.unrestricted,
        //     initialUrl: "https://hst.netr.jp/open/index.php?key=LdYUdyu2&mid=12&sv=11456&sku=4971633002005_4971633002006_4971633002099_4971633002098",
        //   ),
        // ),
      ),
    );
  }
}
