// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, prefer_const_literals_to_create_immutables, deprecated_member_use, unnecessary_new, avoid_print, must_be_immutable, prefer_const_constructors_in_immutables

import 'dart:async';
import 'package:analogclock/available_clock.dart';
import 'package:analogclock/clock%20painter/widget_clock_painter.dart';
import 'package:analogclock/dark%20theme/dark_theme.dart';
import 'package:analogclock/dash%20painter/widget_dash_painter.dart';
import 'package:analogclock/dial/inner_dial.dart';
import 'package:analogclock/dial/main_dial.dart';
import 'package:analogclock/digit_time.dart';
import 'package:analogclock/hour%20painter/widget_hour_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'package:timezone/standalone.dart' as tz1;

bool platformBrightness =
    SchedulerBinding.instance!.window.platformBrightness == Brightness.dark;

class Clock extends StatefulWidget {
  Clock({Key? key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  List<String> _availableTimezones = <String>[];
  List<String> _validLocationOnly = <String>[];

  String locationName = 'Asia/Kolkata';
  bool isDark = platformBrightness ? true : false;
  Color backgroundColor = platformBrightness ? Colors.black : Color(0xFFEEF5FD);

  @override
  void initState() {
    super.initState();
    _initData();
    tz.initializeTimeZones();
    // onlyValidLocation();
    setCurrentTime();
  }

  @override
  Widget build(BuildContext context) {
    var detroit = tz1.getLocation(locationName);
    DateTime currentTime = tz1.TZDateTime.now(detroit);
    var _period = new DateFormat(':a').format(tz1.TZDateTime.now(detroit));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.blueGrey,
          title: Text('Analog clock'),
          backgroundColor: backgroundColor,
          foregroundColor: Colors.blueGrey,
        ),
        backgroundColor: backgroundColor,
        body: Container(
          color: Colors.transparent,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(locationName,
                          style:
                              TextStyle(color: Colors.blueGrey, fontSize: 20)),
                      IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        iconSize: 40,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AvailableClock(
                                      backgroundColor: backgroundColor,
                                      onLocationChanged: (value) {
                                        setState(() {
                                          locationName = value;
                                        });
                                      },
                                      availableTimezones: _validLocationOnly,
                                    )),
                          );
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                  DigitTime(currentTime: currentTime, period: _period)
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                color: Colors.transparent,
                width: 320,
                height: 320,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    MainDial(dark: isDark),
                    InnerDial(dark: isDark),
                    ClockPainterWidget(
                      currentTime: currentTime,
                    ),
                    DashPainterWidget(),
                    HourPainterWidget(),
                    DarkThemeIcon(
                        onDarkModeChanged: (value) {
                          setState(() {
                            isDark = value;
                          });
                        },
                        onBgChanged: (value) {
                          setState(() {
                            backgroundColor = value;
                          });
                        },
                        dark: isDark)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onlyValidLocation() async {
    for (int i = 0; i <= _availableTimezones.length - 1; i++) {
      try {
        var detroit = tz1.getLocation(_availableTimezones[i]);
        _validLocationOnly.add(detroit.toString());
      } catch (e) {
        print('--------------onlyValidLocation error---------');
      }
    }
  }

  Future<void> _initData() async {
    try {
      var _timezone = await FlutterNativeTimezone.getLocalTimezone();
    } catch (e) {
      print('Could not get the local timezone');
    }
    try {
      _availableTimezones = await FlutterNativeTimezone.getAvailableTimezones();
      _availableTimezones.sort();
    } catch (e) {
      print('Could not get available timezones');
    }
    try {
      onlyValidLocation();
    } catch (e) {
      print('---------------crashed----------');
    }
    if (mounted) {
      setState(() {});
    }
  }

  void setCurrentTime() {
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        setState(
          () {
            TimeOfDay _timeOfDay = TimeOfDay.now();
          },
        );
      },
    );
  }
}
