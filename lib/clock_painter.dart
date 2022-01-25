// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double BASE_SIZE = 320.0;
    bool showAllNumbers = true;
    double scaleFactor = size.shortestSide / BASE_SIZE;
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = min(centerX, centerY);
    Offset center = Offset(centerX, centerY);
    double outerRadius = radius - 20;
    double innerRdaius = radius - 30;
    DateTime dateTime = DateTime.now();
    _drawIndicators(canvas, size, scaleFactor, showAllNumbers);

    //dashLine for second
    Paint secDashPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < 360; i += 6) {
      double x1 = centerX - outerRadius * .95 * cos(i * pi / 180);
      double y1 = centerX - outerRadius * .95 * sin(i * pi / 180);

      double x2 = centerX - innerRdaius * cos(i * pi / 180);
      double y2 = centerX - innerRdaius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), secDashPaint);
    }
    //dashLine for hour
    Paint hourDashPaint = Paint()
      ..color = Color(0xFF222E63)
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < 360; i += 30) {
      double x1 = centerX - outerRadius * cos(i * pi / 180);
      double y1 = centerX - outerRadius * sin(i * pi / 180);

      double x2 = centerX - innerRdaius * cos(i * pi / 180);
      double y2 = centerX - innerRdaius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), hourDashPaint);
    }
//second hand paint
    var secHandBrush = Paint()
      ..color = Color(0xFFE81466)
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    //60 sec-360,1 sec =6 degree
    var secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);

    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

//minute hand paint
    var minHandBrush = Paint()
      ..color = Color(0xFFBEC5D5)
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    var minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

//hour hand
    var hourHandBrush = Paint()
      ..color = Color(0xFF222E63)
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    var hourHandX = centerX +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerX +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    Paint centerCirclePaint = Paint()..color = Color(0xFFE81466);

    canvas.drawCircle(center, 6, centerCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

void _drawIndicators(
    Canvas canvas, Size size, double scaleFactor, bool showAllNumbers) {
  TextStyle style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 16.0 * scaleFactor * 1.0);
  double p = 8.0;
  // p += 24.0;

  double r = size.shortestSide / 2;
  double longHandLength = r - (p * scaleFactor);

  for (var h = 1; h <= 12; h++) {
    // if (!showAllNumbers && h % 3 != 80) continue;
    double angle = (h * pi / 6); //+ pi / 2;
    Offset offset =
        Offset(longHandLength * cos(angle), longHandLength * sin(angle));
    TextSpan span = TextSpan(style: style, text: h.toString());
    TextPainter tp = TextPainter(
      text: span,
      // textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
    tp.layout();

    tp.paint(canvas, size.center(offset - tp.size.center(Offset.zero)));
  }
}
