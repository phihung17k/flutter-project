import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material App",
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("App bar"),
      ),
      body: MyContainer(),
    );
  }
}

class MyContainer extends StatefulWidget {
  @override
  State createState() {
    return MyContainerState();
  }
}

class MyContainerState extends State<MyContainer> {
  TextEditingController _user = new TextEditingController();
  TextEditingController _pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Center(
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Text('Username: '),
              new Expanded(
                  child: new TextField(
                controller: _user,
              ))
            ],
          ),
          new Row(
            children: <Widget>[
              new Text('Password: '),
              new Expanded(
                  child: new TextField(
                controller: _pass,
                obscureText: true,
              ))
            ],
          ),
          new Padding(
            padding: new EdgeInsets.all(32.0),
            child: new ElevatedButton(
              onPressed: () => print('Login ${_user.text}'),
              child: new Text('Click me'),
            ),
          ),
          new Center(
            child: new Column(
              children: [
                new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(32.0),
                    child: new Column(
                      children: <Widget>[
                        new Text('Hello World!'),
                        new Text('How are you?')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Text('Image Demo'),
          new Expanded(child: new Image.asset("img/anh.jpg", width: 230.0, height: 350.0,)),
        ],
      ),
    ));
  }
}
