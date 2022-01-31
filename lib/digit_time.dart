// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class DigitTime extends StatelessWidget {
  DigitTime({Key? key, required this.currentTime, required this.period})
      : super(key: key);
  String period;
  DateTime currentTime;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('${currentTime.hour}:${currentTime.minute} ',
            style: TextStyle(color: Colors.blueGrey, fontSize: 40)),
        Text(
          period,
          style: TextStyle(fontSize: 10, color: Colors.blueGrey),
        ),
      ],
    );
  }
}
