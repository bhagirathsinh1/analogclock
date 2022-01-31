// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class InnerDial extends StatelessWidget {
  InnerDial({Key? key, required this.dark}) : super(key: key);
  bool dark;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
