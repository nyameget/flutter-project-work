// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:project_app/comm/comHelper.dart';
import 'package:flutter_switch/flutter_switch.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool isSwitched = false;
  bool status = false;
  bool statusa = false;
  bool statusb = false;
  bool statusc = false;
  bool statusd = false;
  void toggleTimetable(bool valuea) {
    if (valuea == false) {
      toastMsg('You\'ll not receive notifications on timetable updates');
    } else {
      toastMsg('You\'ll receive notifications on timetable updates');
    }
  }

  void toggleLecture(bool valueb) {
    if (valueb == false) {
      toastMsg('You\'ll not receive lecture cancelation notifications');
    } else {
      toastMsg('You\'ll receive lecture cancelation notifications');
    }
  }

  void toggleEmail(bool valuec) {
    if (valuec == false) {
      toastMsg('You\'ll not receive email notifications');
    } else {
      toastMsg('You\'ll receive email notifications');
    }
  }

  void toggleApp(bool valued) {
    if (valued == false) {
      toastMsg('You\'ll not receive app updates');
    } else {
      toastMsg('You\'ll receive app updates');
    }
  }

  void toggleMute(bool valuee) {
    if (valuee == false) {
      toastMsg('You\'ll receive updates');
    } else {
      toastMsg('All notifications are muted');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            SafeArea(
              child: Container(
                width: double.infinity,
                child: Text(
                  'Notifications',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  'Timetable Update',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                FlutterSwitch(
                  onToggle: (valuea) {
                    setState(() {
                      status = valuea;
                      toggleTimetable(valuea);
                    });
                  },
                  value: status,
                  inactiveColor: Colors.grey,
                  activeColor: Colors.green,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  'Lecture Updates',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                FlutterSwitch(
                  onToggle: ((valueb) {
                    setState(() {
                      statusa = valueb;
                      toggleLecture(valueb);
                    });
                  }),
                  value: statusa,
                  inactiveColor: Colors.grey,
                  activeColor: Colors.green,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  'Email Notifications',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                FlutterSwitch(
                  onToggle: ((valuec) {
                    setState(() {
                      statusb = valuec;
                      toggleEmail(valuec);
                    });
                  }),
                  value: statusb,
                  inactiveColor: Colors.grey,
                  activeColor: Colors.green,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  'App Updates',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                FlutterSwitch(
                  onToggle: ((valued) {
                    setState(() {
                      statusc = valued;
                      toggleApp(valued);
                    });
                  }),
                  value: statusc,
                  inactiveColor: Colors.grey,
                  activeColor: Colors.green,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  'Mute Notifications',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
                FlutterSwitch(
                  onToggle: ((valu) {
                    setState(() {
                      statusd = valu;
                      toggleMute(valu);
                    });
                  }),
                  value: statusd,
                  inactiveColor: Colors.grey,
                  activeColor: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
