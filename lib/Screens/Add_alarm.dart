// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, annotate_overrides, avoid_unnecessary_containers, deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'Circle_day.dart';

class AddAlarm extends StatefulWidget {
  _AddAlarmState createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  late TimeOfDay _selectedTime;
  late ValueChanged<TimeOfDay> selectTime;
  @override
  void initState() {
    _selectedTime = const TimeOfDay(hour: 12, minute: 30);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1B2C57),
        appBar: AppBar(
          backgroundColor: Color(0xff1B2C57),
          title: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              Icon(
                Icons.alarm_add,
                color: Color(0xff65D1BA),
              ),
              Text('Add alarm',
                  style: TextStyle(color: Color(0xff65D1BA), fontSize: 25.0))
            ],
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 60.0,
                  ),
                  // ignore: unnecessary_new
                  new GestureDetector(
                    child: Text(
                      _selectedTime.format(context),
                      style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      _selectTime(context);
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleDay('Mon', context, false),
                      CircleDay('Tue', context, true),
                      CircleDay('Wed', context, true),
                      CircleDay('Thu', context, true),
                      CircleDay('Fri', context, false),
                      CircleDay('Sat', context, true),
                      CircleDay('Sun', context, false),
                    ],
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  SizedBox(
                    height: 2.0,
                    child: Container(
                      color: Colors.white30,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                    ),
                    title: Text('Alarm Notification',
                        style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                    height: 2.0,
                    child: Container(
                      color: Colors.white30,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.check_box,
                      color: Colors.white,
                    ),
                    title:
                        Text('Vibrate', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                    height: 2.0,
                    child: Container(
                      color: Colors.white30,
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  FlatButton(
                      color: Theme.of(context).accentColor,
                      child:
                          Text('Save', style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      })
                ],
              ),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pop(),
          backgroundColor: Colors.white,
          child: Icon(
            Icons.delete,
            size: 20.0,
            color: Theme.of(context).accentColor,
          ),
        ));
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _selectedTime);
    setState(
      () {
        _selectedTime = picked!;
      },
    );
  }
}
