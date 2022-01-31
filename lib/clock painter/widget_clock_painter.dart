// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:analogclock/clock%20painter/clock_painter.dart';
import 'package:flutter/material.dart';

class ClockPainterWidget extends StatelessWidget {
  ClockPainterWidget({Key? key, required this.currentTime}) : super(key: key);
  DateTime currentTime;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 2,
      child: Container(
        // color: Colors.red,
        constraints: BoxConstraints.expand(),
        child: CustomPaint(
          painter: ClockPainter(currentTime: currentTime),
        ),
      ),
    );
  }
}
