// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

class HourPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    bool showAllNumbers = true;
    double scaleFactor = size.shortestSide / 320.0;
    _drawIndicators(canvas, size, scaleFactor, showAllNumbers);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

void _drawIndicators(
    Canvas canvas, Size size, double scaleFactor, bool showAllNumbers) {
  TextStyle style = TextStyle(
      color: Colors.blueGrey,
      fontWeight: FontWeight.bold,
      fontSize: 16.0 * scaleFactor * 1.0);
  double p = 9.0;
  // p += 24.0;

  double r = size.shortestSide / 2;
  double longHandLength = r - (p * scaleFactor);

  for (var h = 1; h <= 12; h++) {
    // if (!showAllNumbers && h % 3 != 80) continue;
    double angle = (h * pi / 6) - pi / 2; //+ pi / 2;
    Offset offset =
        Offset(longHandLength * 0.95 * cos(angle), longHandLength * sin(angle));
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
