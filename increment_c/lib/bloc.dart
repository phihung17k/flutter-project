

import 'package:rxdart/rxdart.dart';

class MainBloc {
  BehaviorSubject _controller;

  int counter = 0;

  MainBloc(){
    _controller = BehaviorSubject.seeded(counter);
  }

  void sinkCounter(event) => _controller.sink.add(event);
  Stream<int> get streamCounter => _controller.stream.map<int>((state) => state).distinct();

  void increment(){
    ++counter;
    _controller.sink.add(counter);
  }
}