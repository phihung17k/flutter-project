
class BirdState {
  final double yAxis;
  final double time;
  final double height;
  final double initHeight;

  BirdState({this.yAxis, this.time, this.height, this.initHeight});

  BirdState copyWith({double yAxis, double time, double height, double initHeight}){
    return BirdState(
      yAxis: yAxis ?? this.yAxis,
      time: time ?? this.time,
      height: height ?? this.height,
      initHeight: initHeight ?? this.initHeight
    );
  }
}