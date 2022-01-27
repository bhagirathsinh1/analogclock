// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, prefer_const_literals_to_create_immutables, deprecated_member_use, unnecessary_new

import 'dart:async';
import 'dart:math';

import 'package:analogclock/clock_painter.dart';
import 'package:analogclock/dash_painter.dart';
import 'package:analogclock/hour_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

bool platformBrightness =
    SchedulerBinding.instance!.window.platformBrightness == Brightness.dark;

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  bool dark = platformBrightness ? true : false;

  var bgColor = platformBrightness ? Colors.black : Color(0xFFEEF5FD);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Container(
          width: 320,
          height: 320,
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
                    colors: dark
                        ? [Colors.black, Colors.black54]
                        : [Color(0xFFCFD8DC), Color(0xFFEEF5FD)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey,
                      blurRadius: 20,
                      offset: Offset(-0, -0),
                    ),
                  ],
                ),
              ),
              Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: dark
                        ? [Colors.black87, Colors.black45]
                        : [Color(0xFFCFD8DC), Color(0xFFEEF5FD)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF3F6080).withOpacity(.2),
                      blurRadius: 30,
                      offset: Offset(20, 20),
                    ),
                    BoxShadow(
                      color: Colors.blueGrey,
                      blurRadius: 20,
                      offset: Offset(-0, -0),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                child: FlatButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  // height: 100,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    if (dark == true) {
                      dark = false;
                    } else {
                      dark = true;
                    }
                    changeBackground();
                  },

                  // color: Colors.btnColor,
                  child: new IconTheme(
                      data: new IconThemeData(color: Colors.orange),
                      child: Transform.rotate(
                          angle: 56,
                          child: dark == true
                              ? Icon(Icons.wb_sunny)
                              : Icon(Icons.nightlight_sharp))),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeBackground() {
    if (dark == true) {
      setState(() {
        bgColor = Colors.black;
        // dark = false;
        // platformBrightness = false;
      });
    } else {
      setState(() {
        bgColor = Color(0xFFEEF5FD);
        // dark = true;
        // platformBrightness = true;
      });
    }
  }
}
