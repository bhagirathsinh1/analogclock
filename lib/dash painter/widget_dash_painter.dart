// ignore_for_file: prefer_const_constructors

import 'package:analogclock/dash%20painter/dash_painter.dart';
import 'package:flutter/material.dart';

class DashPainterWidget extends StatelessWidget {
  const DashPainterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      constraints: BoxConstraints.expand(),
      child: RotatedBox(
        quarterTurns: 4,
        child: CustomPaint(
          painter: DashPainter(),
        ),
      ),
    );
  }
}
