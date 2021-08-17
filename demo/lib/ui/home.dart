import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final _user;
  final _pass;

  const MyHomePage.data(this._user, this._pass);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home Page",
      home: Scaffold(
        appBar: AppBar(
          title: Text("App bar"),
        ),
        body: Center(
          child: Text("Welcome $_user"),
        ),
      ),
    );
  }
}
