import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MaterialApp",
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("title/appBar/Scaffold/MyHomePage/home/MaterialApp"),
        backgroundColor: Colors.blue,
        actions: [
          new IconButton(
              icon: Icon(Icons.add),
              onPressed: null,
          ),
          new IconButton(
            icon: Icon(Icons.remove),
            onPressed: null,
          ),
        ],
      ),
      body: new MyBody(),
    );
  }
}

class MyBody extends StatefulWidget {

  @override
  State createState() {
    return MyBodyState();
  }
}

class MyBodyState extends State<MyBody> {
  String value = "No thing";
  Random r = new Random();
  bool checkValue = false;
  bool checkListTileValue = false;
  bool checkListTileValue2 = false;
  int _value1 = 0;
  bool switchValue = false;
  double sliderValue = 0.0;

  void click(String value) {
    setState(() {
      this.value = "$value button ${r.nextInt(1000)}";
    });
  }

  void changeTextField(String input) {
    setState(() {
      this.value = input;
    });
  }

  void submitTextField(String input) {
    setState(() {
      this.value = input;
    });
  }

  void check(bool value) {
    setState(() {
      this.checkValue = value;
      this.value = value.toString();
    });
  }

  void checkListTile(bool value) {
    setState(() {
      this.checkListTileValue = value;
      this.value = value.toString();
    });
  }

  void checkListTile2(bool value) {
    setState(() {
      this.checkListTileValue2 = value;
      this.value = value.toString();
    });
  }

  List<Widget> makeRadios() {
    var list = <Widget>[];
    for (int i = 0; i < 3; i++) {
      list.add(new Radio(
          value: i,
          groupValue: _value1,
          onChanged: (value) => setState(() => _value1 = value)));
    }
    return list;
  }

  List<Widget> makeRadioListTiles() {
    var list = <Widget>[];
    for (int i = 0; i < 3; i++) {
      list.add(new RadioListTile(
        value: i,
        groupValue: _value1,
        onChanged: (value) => setState(() => _value1 = value),
        title: new Text("Radio $i"),
        controlAffinity: ListTileControlAffinity.leading,
        secondary: Icon(Icons.account_balance),
        subtitle: new Text("subtitle"),
        activeColor: Colors.pink,
      ));
    }
    return list;
  }

  Future selectDate() async{
    DateTime time = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2016),
        lastDate: DateTime(2025),
    );
    if(time!=null){
      setState(() {
        value = time.toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
        child: new Container(
        padding: new EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Scrollbar(
          child: new Column(
            children: [
              new Text(value),
              new Row(
                children: [
                  new ElevatedButton(
                    onPressed: () => click("elevated button"),
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(fontFamily: "Times New Roman")),
                    child: new Text("ElevatedButton"),
                  ),
                  new TextButton(
                      onPressed: () => click("text button"),
                      child: new Text("Text Button")),
                  new IconButton(
                    icon: Icon(Icons.access_alarms),
                    onPressed: () => click("icon button"),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              new TextField(
                autofocus: false,
                autocorrect: true,
                keyboardType: TextInputType.number,
                onChanged: changeTextField,
                onSubmitted: submitTextField,
                decoration: InputDecoration(
                  hintText: "hint text",
                  helperText: "help text",
                  hoverColor: Colors.deepOrange,
                  suffixText: "suffix text",
                  prefixText: "prefix text",
                  labelText: "label text",
                  icon: Icon(Icons.wysiwyg),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.pink)),
                ),
              ),
              new Checkbox(
                //only checkbox
                value: checkValue,
                onChanged: (value) => check(value),
                hoverColor: Colors.amber,
              ),
              new CheckboxListTile(
                //checkbox with title, ...
                secondary: new Icon(Icons.access_alarms),
                value: checkListTileValue,
                onChanged: (value) => checkListTile(value),
                title: new Text("title CheckboxListTile"),
                selectedTileColor: Colors.deepOrangeAccent,
                subtitle: new Text("subtitle"),
                controlAffinity: ListTileControlAffinity
                    .leading, //location: checkbox title icon
              ),
              new CheckboxListTile(
                secondary: new Icon(Icons.access_alarms),
                value: checkListTileValue2,
                onChanged: checkListTile2,
                title: new Text("title 2 CheckboxListTile"),
                selectedTileColor: Colors.deepOrangeAccent,
                subtitle: new Text("subtitle 2"),
                controlAffinity: ListTileControlAffinity
                    .trailing, //location icon title checkbox
              ),
              new Row(
                children: makeRadios(),
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              new Column(
                children: makeRadioListTiles(),
              ),
              new Switch(
                  value: switchValue,
                  onChanged: (value) => setState(() => switchValue = value),
              ),
              new SwitchListTile(
                  value: switchValue,
                  onChanged: (value) => setState(() => switchValue = value),
                title: new Text("title SwitchListTile"),
                subtitle: new Text("subTitle"),
                activeColor: Colors.amber,
                tileColor: Colors.lightGreenAccent,
              ),
              new Column(
                children: [
                  new Text((sliderValue*100).round().toString()),
                  new Slider(
                      value: sliderValue.toDouble(),
                      onChanged: (value) => setState(() => sliderValue = value),
                  ),
                ],
              ),
              new Text(value),
              new ElevatedButton(
                  onPressed: selectDate,
                  child: new Text("Select date"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
