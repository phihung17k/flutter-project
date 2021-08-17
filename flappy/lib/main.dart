import 'dart:async';

import 'package:flappy/bloc/bird/bird_bloc.dart';
import 'package:flappy/widgets/bird.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  BirdBloc bloc = BirdBloc();

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  BirdBloc get bloc => widget.bloc;
  Timer timer;

  @override
  void initState() {
    super.initState();
    if(timer == null){
      timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
        // if(bloc.state.yAxis != null && bloc.state.yAxis > 0.8){
        //   timer.cancel();
        // }
        bloc.flyDown();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => bloc.jump(),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Stack(children: [
                  StreamBuilder<double>(
                    stream: bloc.streamYAxis,
                    builder: (context, snapshot) {
                      print("snapshot ${snapshot.hasData}, ${snapshot?.data}");
                      double yAxis = 0;
                      if(snapshot.hasData && snapshot.data != null){
                        yAxis = snapshot.data;
                      }
                      return AnimatedContainer(
                        alignment: Alignment(-0.5, yAxis),
                        duration: Duration(milliseconds: 400),
                        color: Colors.blue,
                        child: BirdWidget(),
                      );
                    }
                  ),
                ])),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.brown,
                )),
          ],
        ),
      ),
    );
  }
}
