// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class MainDial extends StatelessWidget {
  MainDial({Key? key, required this.dark}) : super(key: key);
  bool dark;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
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
