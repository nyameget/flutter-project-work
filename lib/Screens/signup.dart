// ignore_for_file: prefer_const_constructors, deprecated_member_use, avoid_unnecessary_containers, avoid_print, unused_local_variable, unused_import, unnecessary_new, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:project_app/Screens/login.dart';
import '/comm/comHelper.dart';
import '/comm/genHeader.dart';
import '/comm/getTextFormField.dart';
import '/models/usermodel.dart';
import '../db/dbhelper.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = new GlobalKey<FormState>();
  final _conName = TextEditingController();
  final _conUsername = TextEditingController();
  final _conEmail = TextEditingController();
  final _conYear = TextEditingController();
  final _conPass = TextEditingController();
  final _conPassConfirm = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  signUp() async {
    String username = _conUsername.text;
    String name = _conName.text;
    String email = _conEmail.text;
    String year = _conYear.text;
    String password = _conPass.text;
    String passwordconfirm = _conPassConfirm.text;

    if (_formKey.currentState!.validate()) {
      if (password != passwordconfirm) {
        toastMsg('Password Mismatch');
        print('pass error');
      } else {
        _formKey.currentState!.save();
        UserModel uModel = UserModel(username, name, email, year, password);
        await dbHelper.saveData(uModel).then((userData) {
          toastMsg('Successfully Saved');
          print('saved');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => LoginForm()),
          );
        }).catchError((error) {
          print(error);
          toastMsg('Error: Data Save Fail');
          print('Failed');
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login with Signup'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Header('Signup'),
                  GetTextFormField(
                    controller: _conUsername,
                    hintName: 'Username',
                    icon: Icons.person,
                    display: TextInputType.name,
                  ),
                  SizedBox(height: 5.0),
                  GetTextFormField(
                    controller: _conName,
                    hintName: 'Name',
                    icon: Icons.person_outline,
                    display: TextInputType.name,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  GetTextFormField(
                    controller: _conEmail,
                    hintName: 'Email',
                    icon: Icons.email,
                    display: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 5.0),
                  GetTextFormField(
                    controller: _conYear,
                    hintName: 'Year',
                    icon: Icons.calendar_month,
                    display: TextInputType.number,
                  ),
                  SizedBox(height: 5.0),
                  GetTextFormField(
                    controller: _conPass,
                    hintName: 'Password',
                    icon: Icons.lock,
                    isObscureText: true,
                  ),
                  SizedBox(height: 5.0),
                  GetTextFormField(
                    controller: _conPassConfirm,
                    hintName: 'Confirm Password',
                    icon: Icons.lock,
                    isObscureText: true,
                  ),
                  Container(
                      margin: EdgeInsets.all(30.0),
                      width: double.infinity,
                      // ignore: sort_child_properties_last
                      child: FlatButton(
                        onPressed: signUp,
                        child: Text(
                          'Signup',
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
                      Text('Do you have an account?'),
                      FlatButton(
                          textColor: Colors.blue,
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => LoginForm()),
                                ((Route<dynamic> route) => false));
                          },
                          child: Text('Login'))
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
