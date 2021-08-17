
import 'package:rxdart/rxdart.dart';

abstract class MainBloc<T extends dynamic>{

  BehaviorSubject _controller;

  MainBloc(T state){
    _controller = BehaviorSubject.seeded(state);
  }

  // Stream<T> get stateStream => _controller.stream;
  
}