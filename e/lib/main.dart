import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Material App",
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  State createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State<MyHome> {
  String _value = "no thing";
  List<Chip> chips = [];
  int counter = 0;
  double slider = 0.0;

  Animals _selected = Animals.Cat;
  List<PopupMenuEntry<Animals>> _items = [];

  @override
  void initState() {
    for(int i = 0; i<4; i++){
      chips.add(newChip(i));
    }
    for(Animals animal in Animals.values) {
      _items.add(new PopupMenuItem(
        child: new Text(_getDisplay(animal),),
        value: animal,
      ));
    }
  }

  Widget newChip(int i){
    Key key = new Key("$i");
    Chip x = new Chip(
      key: key,
      label: new Text("chip $i"),
      avatar: new CircleAvatar(
        child: new Text("$i"),
        backgroundColor: Colors.pinkAccent,
      ),
      deleteIcon: new Icon(Icons.delete_outlined),
      deleteButtonTooltipMessage: "Delete",
      onDeleted: () => setState(() => removeChip(key)),
    );
    counter++;
    return x;
  }

  removeChip(Key key){
    for(int j = 0; j<chips.length; j++){
      if(chips[j].key == key){
          chips.removeAt(j);
        return;
      }
    }
  }

  void _onSelected(Animals animal) {
    setState((){
      _selected = animal;
      _value = 'You Selected ${_getDisplay(animal)}';
    });
  }

  String _getDisplay(Animals animal) {  //Animals.Fish
    int index = animal.toString().indexOf('.');
    index++;
    print("print animal: $animal and $index and ${animal.toString().substring(index)}");
    return animal.toString().substring(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("App bar"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: new Column(
          children: [
            new Row(
              children: [
                new Text(_value),
                new IconButton(
                  icon: Icon(Icons.alarm),
                  onPressed: () =>
                      setState(() => _value = "${DateTime.now()}".split(" ")[0]),
                  tooltip: "Display",
                )
              ],
            ),
            new Column(
              children: chips,
            ),
            new Text("${(slider*100).round()}"),
            new Slider(
              value: slider,
              onChanged: (value) => setState(()=> slider = value),
            ),
            new LinearProgressIndicator(value: slider,),
            new CircularProgressIndicator(value: slider,),
            new PopupMenuButton<Animals>(
                child:  new Icon(Icons.input),
                initialValue: Animals.Cat,
                onSelected: _onSelected,
                itemBuilder: (BuildContext context) {
                  return _items;
                }
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => chips.add(newChip(counter))),
        child: Icon(Icons.add),
      ),
    );
  }
}
enum Animals{Cat, Dog, Bird, Lizard, Fish}