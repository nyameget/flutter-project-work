// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_import, import_of_legacy_library_into_null_safe, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:project_app/Screens/login.dart';
import 'package:project_app/home.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Screens/Add_alarm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: SplashScreen(
          seconds: 7,
          navigateAfterSeconds: LoginForm(),
          title: Text(
            'Welcome to Timetable',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          image: Image.asset(
            'images/Timetable.png',
          ),
          backgroundColor: Colors.white,
          loaderColor: Colors.red,
          loadingText: Text(
            'Loading, Please Wait',
            style: TextStyle(
              fontFamily: 'lib/fonts/RubikDistressed-Regular.ttf',
            ),
          ),
          photoSize: 100.0,
        ),
      ),
    );
  }
}
