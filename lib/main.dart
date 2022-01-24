// ignore_for_file: prefer_const_constructors

import 'package:analogclock/clock.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFEBF3FE)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: Clock())),
    );
  }
}
