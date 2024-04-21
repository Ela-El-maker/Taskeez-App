import 'package:flutter/material.dart';

import '../../constants/values.dart';

class DarkRadialBackground extends StatelessWidget {
  final String position;
  final Color color;

  var list = List.generate(
    3,
    (index) => HexColor.fromHex("1D192D"),
  );
  DarkRadialBackground(
      {super.key, required this.position, required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
          colors: [...list, this.color],
          center: (position == "bottomRight")
              ? Alignment(1.0, 1.0)
              : Alignment(-1.0, -1.0),
        )),
      ),
    );
  }
}
