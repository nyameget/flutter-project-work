// ignore_for_file: prefer_const_constructors, file_names, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

Widget alarmItem(hour, enabled) {
  bool status;
  return Padding(
    padding: EdgeInsets.all(17.0),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  hour,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceSansPro'),
                ),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        'Sun',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        'Mon',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        'Tue',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ],
            ),
            FlutterSwitch(
              onToggle: (value) {
                status = enabled;
              },
              value: enabled,
              activeColor: Color(0xff65D1BA),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        SizedBox(
          height: 1.0,
          width: double.maxFinite,
          child: Container(
            color: Colors.white30,
          ),
        )
      ],
    ),
  );
}
