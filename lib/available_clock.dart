// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/standalone.dart' as tz1;

class AvailableClock extends StatefulWidget {
  AvailableClock(
      {Key? key,
      required this.availableTimezones,
      required this.onLocationChanged,
      required this.backgroundColor})
      : super(key: key);
  List<String> availableTimezones = <String>[];
  final ValueChanged<String> onLocationChanged;
  Color backgroundColor;

  @override
  _AvailableClockState createState() => _AvailableClockState();
}

class _AvailableClockState extends State<AvailableClock> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        shadowColor: Colors.blueGrey,
        title: Text('Availabe Maps'),
        backgroundColor: widget.backgroundColor,
        foregroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            icon: Icon(Icons.location_city_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 3),
        child: ListView.builder(
          // reverse: true,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: widget.availableTimezones.length,
          itemBuilder: (_, index) {
            var detroit = tz1.getLocation(widget.availableTimezones[index]);
            // DateTime currentTime = tz1.TZDateTime.now(detroit);
            var _period =
                new DateFormat('hh:mm:a').format(tz1.TZDateTime.now(detroit));

            return Card(
              shadowColor: Colors.blueGrey,
              color: widget.backgroundColor,
              child: ListTile(
                title: Text(
                  widget.availableTimezones[index],
                  style: TextStyle(color: Colors.blueGrey),
                ),
                subtitle: Text(_period.toString(),
                    style: TextStyle(color: Colors.blueGrey)),
                leading: Icon(
                  Icons.location_on_outlined,
                  color: Colors.blueGrey,
                ),
                onTap: () {
                  setState(() {
                    widget.onLocationChanged(widget.availableTimezones[index]);
                  });

                  Navigator.pop(context);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
