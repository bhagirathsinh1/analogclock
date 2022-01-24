// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: 300,
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFE3F0F8), Color(0xFFEEF5FD)],
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF3F6080).withOpacity(.2),
                  blurRadius: 32,
                  offset: Offset(10, 5),
                ),
                BoxShadow(
                  color: Color(0xFFFFFFFF),
                  blurRadius: 32,
                  offset: Offset(-10, -5),
                ),
              ],
            ),
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFE3F0F8), Color(0xFFEEF5FD)],
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF3F6080).withOpacity(.2),
                  blurRadius: 32,
                  offset: Offset(40, 20),
                ),
                BoxShadow(
                  color: Color(0xFFFFFFFF),
                  blurRadius: 32,
                  offset: Offset(-20, -10),
                ),
              ],
            ),
          ),
          Transform.rotate(
            angle: pi / 2,
            child: Container(
              constraints: BoxConstraints.expand(),
              child: CustomPaint(
                painter: ClockPainter(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

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

    //second hand
    Paint secLinePaint = Paint()
      ..color = Colors.red
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
      centerX - outerRadius * .4 * cos(datetime.hour * 6 * pi / 180),
      centerY - outerRadius * .4 * sin(datetime.hour * 6 * pi / 180),
    );
    Offset hourStartOffset = Offset(
      centerX + 15 * cos(datetime.hour * 6 * pi / 180),
      centerY + 15 * sin(datetime.hour * 6 * pi / 180),
    );
    canvas.drawLine(hourStartOffset, hourEndOffset, hourLinePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
