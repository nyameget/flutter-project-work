// ignore_for_file: file_names, unused_import, unnecessary_import, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_final_fields, prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_app/Screens/Add_alarm.dart';
import 'Alarm_item.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class Alarm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AlarmState();
  }
}

class AlarmState extends State<Alarm> {
  String _timeString = "12 : 30";
  String _timeString2 = "07 : 20";
  String _timeString3 = "18 : 10";
  String _timeString4 = "13 : 45";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        child: ListView(
          children: <Widget>[
            alarmItem(_timeString, true),
            alarmItem(_timeString2, true),
            alarmItem(_timeString3, false),
            alarmItem(_timeString4, false),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => AddAlarm()),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
