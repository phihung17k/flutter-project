

import 'package:rxdart/rxdart.dart';

class MainBloc {
  BehaviorSubject<int> counterSubject = BehaviorSubject.seeded(0);//init value

  Stream<int> get countStream => counterSubject.stream;

  void increment(){
    counterSubject.sink.add(0);
  }
}