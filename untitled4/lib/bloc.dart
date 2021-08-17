
import 'package:rxdart/rxdart.dart';

abstract class MainBloc<T extends dynamic>{

  BehaviorSubject _controller;

  MainBloc({T state}){
    _controller = BehaviorSubject<T>.seeded(state);
  }

  Stream<T> get stateStream => _controller?.stream?.map((event) => event);

  T get state => _controller?.value;


}