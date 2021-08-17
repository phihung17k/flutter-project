import 'package:flutter/material.dart';

class BirdWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Image(
      image: AssetImage("assets/bird.png"),
      width: screenWidth / 7,
    );
  }
}
