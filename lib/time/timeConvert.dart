import 'package:flutter/material.dart';
import 'dart:async';
import "package:intl/intl.dart";

class Calendar extends StatefulWidget {

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  String _timeString = ' ';
  String _zoneString = 'WIB';

  @override
  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now(), _zoneString);
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    _timeString = _formatDateTime(now, _zoneString);
    setState(() {});
  }

  String _formatDateTime(DateTime dateTime, String zone) {
    if (zone == 'WIB') {
      dateTime = dateTime.add(Duration(hours: 0));
    } else if (zone == 'WITA') {
      dateTime = dateTime.add(Duration(hours: 1));
    } else if (zone == 'WIT') {
      dateTime = dateTime.add(Duration(hours: 2));
    } else if (zone == 'London'){
      dateTime = dateTime.add(Duration(hours: -6));
    }
    String formattedDateTime =
    DateFormat('EEEE, dd MMMM yyyy - HH:mm:ss').format(dateTime);
    return formattedDateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text('Clock'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _timeString,
              style: TextStyle(fontSize: 32.0),
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: _zoneString,
              items: [
                DropdownMenuItem<String>(
                  child: Text('WIB'),
                  value: 'WIB',
                ),
                DropdownMenuItem<String>(
                  child: Text('WITA'),
                  value: 'WITA',
                ),
                DropdownMenuItem<String>(
                  child: Text('WIT'),
                  value: 'WIT',
                ),
                DropdownMenuItem<String>(
                  child: Text('London'),
                  value: 'London',
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _zoneString = value!;
                  _timeString = _formatDateTime(DateTime.now(), _zoneString);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

}
