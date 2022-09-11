// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names, avoid_unnecessary_containers, sized_box_for_whitespace, deprecated_member_use, unused_import, prefer_final_fields, unnecessary_new, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:project_app/Screens/Settings.dart';
import 'package:project_app/Screens/login.dart';
import 'package:project_app/comm/comHelper.dart';
import 'package:project_app/comm/getTextFormField.dart';
import 'package:project_app/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../comm/genHeader.dart';
import '../db/dbhelper.dart';
import '../models/usermodel.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final _formKey = new GlobalKey<FormState>();

  int index = 2;
  final _conUsername = TextEditingController();
  final _conName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conYear = TextEditingController();
  final _conPass = TextEditingController();
  var dbHelper;
  @override
  void initState() {
    super.initState();
    getUserData();
    dbHelper = DbHelper();
  }

  Future<void> getUserData() async {
    final SharedPreferences sp = await _pref;
    setState(() {
      _conUsername.text = sp.getString("username").toString();
      _conName.text = sp.getString("name").toString();
      _conEmail.text = sp.getString("email").toString();
      _conYear.text = sp.getString("year").toString();
      _conPass.text = sp.getString("password").toString();
    });
  }

  update() async {
    String username = _conUsername.text;
    String name = _conName.text;
    String email = _conEmail.text;
    String year = _conYear.text;
    String password = _conPass.text;
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      UserModel user = UserModel(username, name, email, year, password);
      await dbHelper.updateUser(user).then((value) {
        if (value == 1) {
          toastMsg("Successfully Updated");
          updateSP(user, true).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => HomePage()),
                (Route<dynamic> route) => false);
          });
        } else {
          toastMsg("Error Update");
        }
      }).catchError((error) {
        toastMsg(error);
      });
    }
  }

  Future updateSP(UserModel user, bool add) async {
    final SharedPreferences sp = await _pref;
    if (add) {
      sp.setString("name", user.name);
      sp.setString("email", user.email);
      sp.setString("year", user.year);
      sp.setString("password", user.password);
    } else {
      sp.remove('username');
      sp.remove("name");
      sp.remove("email");
      sp.remove("year");
      sp.remove("password");
    }
  }

  delete() async {
    String username = _conUsername.text;
    String name = _conName.text;
    String email = _conEmail.text;
    String year = _conYear.text;
    String password = _conPass.text;
    UserModel user = UserModel(username, name, email, year, password);
    await dbHelper.deleteUser(username).then((value) {
      updateSP(user, false).whenComplete(() {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => LoginForm()),
            (Route<dynamic> route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 25),
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      SafeArea(
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(height: 5.0),
                      GetTextFormField(
                        controller: _conName,
                        hintName: 'Name',
                        icon: Icons.person_outline,
                        display: TextInputType.name,
                      ),
                      SizedBox(height: 10.0),
                      GetTextFormField(
                        controller: _conEmail,
                        hintName: 'Email',
                        icon: Icons.email,
                        display: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 10.0),
                      GetTextFormField(
                        controller: _conYear,
                        hintName: 'Year',
                        icon: Icons.calendar_month,
                        display: TextInputType.number,
                      ),
                      SizedBox(height: 10.0),
                      GetTextFormField(
                        controller: _conPass,
                        hintName: 'Password',
                        icon: Icons.lock,
                        isObscureText: true,
                      ),
                      SizedBox(height: 10.0),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20.0),
                        alignment: Alignment.bottomRight,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          color: Colors.green,
                          // ignore: sort_child_properties_last
                          child: Text(
                            'Update Details',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: update,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 4,
                          ),
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 0.3,
                          ),
                          FlatButton(
                            onPressed: delete,
                            child: Container(
                              // ignore: sort_child_properties_last
                              child: Text(
                                'Delete Account',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              margin: EdgeInsets.only(left: 10.0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
