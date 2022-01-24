import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = min(centerX, centerY);
    Offset center = Offset(centerX, centerY);
    double outerRadius = radius - 20;
    double innerRdaius = radius - 30;
    DateTime datetime = DateTime.now();

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
