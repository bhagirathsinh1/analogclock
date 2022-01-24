// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double BASE_SIZE = 320.0;
    bool showAllNumbers = true;
    double scaleFactor = size.shortestSide / BASE_SIZE;
    bool showTicks = true;
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = min(centerX, centerY);
    Offset center = Offset(centerX, centerY);
    double outerRadius = radius - 20;
    double innerRdaius = radius - 30;
    DateTime datetime = DateTime.now();
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

    //second hand
    Paint secLinePaint = Paint()
      ..color = Color(0xFFE81466)
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    Offset secEndOffset = Offset(
      centerX + 15 * cos(datetime.second * 6 * pi / 180),
      centerY + 15 * sin(datetime.second * 6 * pi / 180),
    );
    Offset secStartOffset = Offset(
      centerX - outerRadius * cos(datetime.second * 6 * pi / 180),
      centerY - outerRadius * sin(datetime.second * 6 * pi / 180),
    );
    canvas.drawLine(secStartOffset, secEndOffset, secLinePaint);

//minute hand
    Paint minLinePaint = Paint()
      ..color = Color(0xFFBEC5D5)
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    Offset minEndOffset = Offset(
      centerX - outerRadius * .6 * cos(datetime.minute * 6 * pi / 180),
      centerY - outerRadius * .6 * sin(datetime.minute * 6 * pi / 180),
    );
    Offset minStartOffset = Offset(
      centerX + 15 * cos(datetime.minute * 6 * pi / 180),
      centerY + 15 * sin(datetime.minute * 6 * pi / 180),
    );
    canvas.drawLine(minStartOffset, minEndOffset, minLinePaint);

//hour hand

    Paint hourLinePaint = Paint()
      ..color = Color(0xFF222E63)
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    Offset hourEndOffset = Offset(
      centerX - outerRadius * .8 * cos(datetime.hour * 8 * pi / 180),
      centerY - outerRadius * .8 * sin(datetime.hour * 10 * pi / 180),
    );
    Offset hourStartOffset = Offset(
      centerX + 15 * cos(datetime.hour * 8 * pi / 180),
      centerY + 15 * sin(datetime.hour * 10 * pi / 180),
    );
    canvas.drawLine(hourStartOffset, hourEndOffset, hourLinePaint);

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
  double p = 10.0;
  // p += 24.0;

  double r = size.shortestSide / 2;
  double longHandLength = r - (p * scaleFactor);

  for (var h = 1; h <= 12; h++) {
    if (!showAllNumbers && h % 3 != 0) continue;
    double angle = (h * pi / 6) - pi; //+ pi / 2;
    Offset offset =
        Offset(longHandLength * cos(angle), longHandLength * sin(angle));
    TextSpan span = TextSpan(style: style, text: h.toString());
    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    tp.paint(canvas, size.center(offset - tp.size.center(Offset.zero)));
  }
}
