import 'package:analogclock/hour%20painter/hour_painter.dart';
import 'package:flutter/material.dart';

class HourPainterWidget extends StatelessWidget {
  const HourPainterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      constraints: const BoxConstraints.expand(),
      child: RotatedBox(
        quarterTurns: 4,
        child: CustomPaint(
          painter: HourPainter(),
        ),
      ),
    );
  }
}
