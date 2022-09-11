// ignore_for_file: prefer_const_constructors, deprecated_member_use, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, unused_field, unnecessary_new, avoid_print, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:project_app/Screens/signup.dart';
import 'package:project_app/comm/genHeader.dart';
import 'package:project_app/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../comm/comHelper.dart';
import '../models/usermodel.dart';
import '/comm/getTextFormField.dart';
import '../db/dbhelper.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  final _formKey = new GlobalKey<FormState>();
  final _conpassCode = TextEditingController();
  final _conUser = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  login() async {
    String username = _conUser.text;
    String password = _conpassCode.text;
    if (username.isEmpty) {
      toastMsg('Please Enter Username');
    } else if (password.isEmpty) {
      toastMsg('Please Enter password');
    } else {
      await dbHelper.getLoginUser(username, password).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => HomePage()),
                (Route<dynamic> route) => false);
          });
        } else {
          toastMsg('Error: User Not Found');
          print('user not found');
        }
      }).catchError((error) {
        print(error);
        toastMsg('Error: Login Fail');
      });
    }
  }

  Future setSP(UserModel user) async {
    final SharedPreferences sp = await _pref;
    sp.setString("username", user.username);
    sp.setString("name", user.name);
    sp.setString("email", user.email);
    sp.setString("year", user.year);
    sp.setString("password", user.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login with Signup')),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Header('Login'),
                GetTextFormField(
                  controller: _conUser,
                  hintName: 'Username',
                  icon: Icons.person,
                  display: TextInputType.name,
                ),
                SizedBox(
                  height: 20.0,
                ),
                GetTextFormField(
                  controller: _conpassCode,
                  hintName: 'Password',
                  icon: Icons.lock,
                  isObscureText: true,
                ),
                Container(
                    margin: EdgeInsets.all(30.0),
                    width: double.infinity,
                    // ignore: sort_child_properties_last
                    child: FlatButton(
                      onPressed: login,
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30.0))),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Does not have an account?'),
                    FlatButton(
                        textColor: Colors.blue,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => SignupForm()),
                          );
                        },
                        child: Text('Signup'))
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
