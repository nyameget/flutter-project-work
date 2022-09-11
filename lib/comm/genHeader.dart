// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, must_be_immutable, file_names

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  String headerName;
  Header(this.headerName);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 50.0,
          ),
          Text(
            headerName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Image.asset(
            "images/Timetable.png",
            height: 150.0,
            width: 150.0,
          ),
          SizedBox(height: 10.0),
          Text(
            'Timetable App',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Colors.black38,
            ),
          ),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
