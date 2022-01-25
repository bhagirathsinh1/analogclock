// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:math';

import 'package:analogclock/clock_painter.dart';
import 'package:analogclock/dash_painter.dart';
import 'package:analogclock/hour_painter.dart';
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
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  color: Colors.white,
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
                  color: Colors.white,
                  blurRadius: 32,
                  offset: Offset(-20, -10),
                ),
              ],
            ),
          ),
          Transform.rotate(
            angle: -pi / 2,
            child: Container(
              // color: Colors.red,
              constraints: BoxConstraints.expand(),
              child: CustomPaint(
                painter: ClockPainter(),
              ),
            ),
          ),
          Container(
            // color: Colors.red,
            constraints: BoxConstraints.expand(),
            child: RotatedBox(
              quarterTurns: 4,
              child: CustomPaint(
                painter: DashPainter(),
              ),
            ),
          ),
          Container(
            // color: Colors.red,
            constraints: BoxConstraints.expand(),
            child: RotatedBox(
              quarterTurns: 4,
              child: CustomPaint(
                painter: HourPainter(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
