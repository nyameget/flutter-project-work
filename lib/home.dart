// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:project_app/Screens/Alarm.dart';
import 'package:project_app/Screens/Home.dart';
import 'package:project_app/Screens/Settings.dart';
import 'package:project_app/Screens/Add_alarm.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int index = 1;

  final screens = [
    Alarm(),
    Home(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/add-alarm': (context) => AddAlarm(),
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          color: Colors.deepPurple.shade200,
          index: index,
          onTap: (index) => setState(() => this.index = index),
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.deepPurple.shade200,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(
            milliseconds: 300,
          ),
          items: <Widget>[
            Icon(
              color: Colors.white,
              Icons.alarm,
              size: 30,
            ),
            Icon(
              color: Colors.white,
              Icons.home,
              size: 30,
            ),
            Icon(
              color: Colors.white,
              Icons.settings,
              size: 30,
            ),
          ],
        ),
        body: screens[index],
      ),
    );
  }
}
