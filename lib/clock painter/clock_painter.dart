// ignore_for_file: prefer_const_constructors
import 'dart:math';
import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  ClockPainter({Key? key, required this.currentTime});
  DateTime currentTime;
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

//second hand paint
    var secHandBrush = Paint()
      ..color = Color(0xFFE81466)
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    //60 sec-360,1 sec =6 degree
    var secHandX = centerX + 80 * cos(currentTime.second * 6 * pi / 180);
    var secHandY = centerX + 80 * sin(currentTime.second * 6 * pi / 180);

    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

//minute hand paint
    var minHandBrush = Paint()
      ..color = Colors.grey
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    var minHandX = centerX + 80 * cos(currentTime.minute * 6 * pi / 180);
    var minHandY = centerX + 80 * sin(currentTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

//hour hand paint
    var hourHandBrush = Paint()
      ..color = Colors.blueGrey
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    var hourHandX = centerX +
        60 * cos((currentTime.hour * 30 + currentTime.minute * 0.5) * pi / 180);
    var hourHandY = centerX +
        60 * sin((currentTime.hour * 30 + currentTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    Paint centerCirclePaint = Paint()..color = Color(0xFFE81466);

    canvas.drawCircle(center, 6, centerCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
