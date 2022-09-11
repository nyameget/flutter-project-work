// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:project_app/Screens/NotificationsPage.dart';
import 'package:project_app/Screens/Profile.dart';
import 'package:project_app/Screens/login.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        margin: EdgeInsets.only(left: 15.0, right: 15.0),
        child: SafeArea(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  'Settings',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'General',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 0.3,
                  ),
                  FlatButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(),
                      ),
                    ),
                    child: Text(
                      'Edit Your Account Information',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 0.3,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => LoginForm()),
                          (Route<dynamic> route) => false);
                    },
                    child: Container(
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      margin: EdgeInsets.only(left: 10.0),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.notification_add,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 0.3,
                  ),
                  FlatButton(
                    child: Text(
                      'Nofications',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationPage(),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.feedback,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Feedback',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.bug_report_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Report A Bug',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.feedback_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Send A Feedback',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.contact_page_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Contact Us',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
