import 'dart:async';
import 'dart:math';

import '../bloc.dart';
import 'bird_state.dart';

class BirdBloc extends MainBloc<BirdState> {
  BirdBloc() : super(state: BirdState());

  Stream<double> get streamYAxis => stateStream.map((state) => state.yAxis);

  void flyDown() {
    if (state.yAxis != null) {
      double time = state.time + 0.05;
      double height = 0.5 * 9.8 * pow(time, 2) ;
      print("time $time, height $height");
      emit(state.copyWith(
        yAxis: state.yAxis + height,
        time: time,
        height: height,
      ));
    } else {
      emit(state.copyWith(
        yAxis: 0,
        time: 0,
        height: 0,
        initHeight: 0,
      ));
    }
  }

  void jump() {
    print("state.yAxis, ${state.yAxis}");
    emit(state.copyWith(
      yAxis: state.yAxis != null ? state.yAxis - 0.05 : -0.05,
      time: 0,
      initHeight: state.yAxis,
    ));
  }
}
