// ignore_for_file: prefer_const_constructors, deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';

class DarkThemeIcon extends StatefulWidget {
  DarkThemeIcon(
      {Key? key,
      required this.onDarkModeChanged,
      required this.onBgChanged,
      required this.dark})
      : super(key: key);

  @override
  _DarkThemeIconState createState() => _DarkThemeIconState();
  final ValueChanged<bool> onDarkModeChanged;

  final ValueChanged<Color> onBgChanged;
  bool dark;
}

class _DarkThemeIconState extends State<DarkThemeIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        // height: 100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          if (widget.dark == false) {
            setState(() {
              widget.onBgChanged(Colors.black);
              widget.onDarkModeChanged(true);
            });
          } else {
            setState(() {
              widget.onBgChanged(Color(0xFFEEF5FD));
              widget.onDarkModeChanged(false);
            });
          }
        },

        // color: Colors.btnColor,
        child: IconTheme(
          data: IconThemeData(color: Colors.orange),
          child: Transform.rotate(
            angle: 56,
            child: widget.dark == true
                ? Icon(Icons.wb_sunny)
                : Icon(Icons.nightlight_sharp),
          ),
        ),
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      ),
    );
  }
}
