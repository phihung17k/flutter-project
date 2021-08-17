import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Expanded(flex: 3, child: Container(
                  color: Colors.lightBlue[100],
                )),
                Expanded(flex: 1, child: Container(
                  color: Colors.lightGreenAccent,
                )),
              ],
            ),
            Image.asset("assets/images/bird.png"),
          ],
        ),
      ),
    );
  }
}
