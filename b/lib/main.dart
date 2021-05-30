import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Material App",
      home: new MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  State createState() {
    return MyHomeState();
  }
}
enum Answers{YES,NO,MAYBE}

class MyHomeState extends State<MyHome> {
  int value = 1;
  String value2 = "";
  List<BottomNavigationBarItem> inits;
  int index = 0;
  final GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey<ScaffoldState>();
  String rs = "";

  @override
  void initState() {
    inits = [];
    inits.add(new BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"));
    inits.add(new BottomNavigationBarItem(icon: Icon(Icons.weekend), label: "Weekend"));
    inits.add(new BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message"));
  }

  void showBottom(){
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context){
          return new Container(
            padding: EdgeInsets.all(10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new Text("something"),
                new ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: new Text("close")
                ),
              ],
            ),
          );
        }
    );
  }

  void showBar(){
    // _scaffoldState.currentState.showSnackBar(new SnackBar(content: new Text("snack bar")));
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(content: new Text("snack bar")));
  }

  Future _showAlert(BuildContext context, String message) async {
    return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            new TextButton(onPressed: () => Navigator.pop(context), child: new Text('Ok'))
          ],
        )

    );
  }

  void _setRs(String value) => setState(() => rs = value);
  Future _askUser() async {
    switch(
    await showDialog(
        context: context,
        /*
       Older Flutter Versions
        child: new SimpleDialog(
          title: new Text('Do you like Flutter?'),
          children: <Widget>[
            new SimpleDialogOption(child: new Text('Yes!!!'),onPressed: (){Navigator.pop(context, Answers.YES);},),
            new SimpleDialogOption(child: new Text('NO :('),onPressed: (){Navigator.pop(context, Answers.NO);},),
            new SimpleDialogOption(child: new Text('Maybe :|'),onPressed: (){Navigator.pop(context, Answers.MAYBE);},),
          ],
        )
        */
        builder: (BuildContext context) {
          return new SimpleDialog(
            title: new Text('Do you like Flutter?'),
            children: <Widget>[
              new SimpleDialogOption(child: new Text('Yes!!!'),onPressed: (){Navigator.pop(context, Answers.YES);},),
              new SimpleDialogOption(child: new Text('NO :('),onPressed: (){Navigator.pop(context, Answers.NO);},),
              new SimpleDialogOption(child: new Text('Maybe :|'),onPressed: (){Navigator.pop(context, Answers.MAYBE);},),
            ],
          );
        }
    )
    ) {
      case Answers.YES:
        _setRs('Yes');
        break;
      case Answers.NO:
        _setRs('No');
        break;
      case Answers.MAYBE:
        _setRs('Maybe');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("app bar"),
        actions: [
          new IconButton(
              icon: Icon(Icons.add),
              onPressed: () => setState(() => MyText(value++))),
          new IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => setState(() => MyText(value--))),
        ],
      ),
      drawer: new Drawer(
        child: new Container(
          padding: EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new Text("drawer"),
              new ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: new Text("Closed"))
            ],
          ),
        ),
      ),
      body: new Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: new Column(
          children: [
            MyText(value),
            new Text(value2),
            new Text(rs),
            new ElevatedButton(onPressed: showBottom, child: new Text("show bottom")),
            new ElevatedButton(onPressed: showBar, child: new Text("show snack bar")),
            new ElevatedButton(onPressed: ()=> _showAlert(context, "This is alert"),
                child: new Text("show alert")
            ),
            new ElevatedButton(onPressed: _askUser, child: new Text("show simple dialog")),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => setState(() => MyText(value *= 10)),
        mini: false,
        child: Icon(Icons.multitrack_audio),
      ),
      persistentFooterButtons: <Widget>[
        new IconButton(
            icon: Icon(Icons.timer),
            onPressed: () => setState(() => value2 = "Timer")),
        new IconButton(
            icon: Icon(Icons.search),
            onPressed: () => setState(() => value2 = "Search")),
        new IconButton(
            icon: Icon(Icons.accessibility_new_rounded),
            onPressed: () => setState(() => value2 = "Accessibility")),
      ],
      bottomNavigationBar: new BottomNavigationBar(
        items: inits,
        fixedColor: Colors.amber,
        currentIndex: index,
        onTap: (int item) => setState(() {
          index = item;
          value2 = "Current $index";
        }),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  final value;
  String value2;

  MyText([this.value]);

  @override
  Widget build(BuildContext context) {
    return new Text(
      value.toString(),
      style: new TextStyle(
        color: Colors.pink,
        fontSize: 50.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
