
import 'package:rxdart/rxdart.dart';

abstract class MainBloc<T extends dynamic> {

  BehaviorSubject<T> controller;

  MainBloc({T state}){
    controller = BehaviorSubject.seeded(state);
  }

  Stream<T> get stateStream => controller.stream;

  T get state => controller?.value;

  void emit(T state){
    controller?.sink?.add(state);
  }
}