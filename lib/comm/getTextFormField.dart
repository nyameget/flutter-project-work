// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors, unnecessary_const, prefer_is_empty

import 'package:flutter/material.dart';
import '/comm/comHelper.dart';

class GetTextFormField extends StatelessWidget {
  TextEditingController controller;
  String hintName;
  IconData icon;
  bool isObscureText;
  TextInputType display;
  bool isEnabled;
  GetTextFormField(
      {required this.controller,
      required this.hintName,
      required this.icon,
      this.isObscureText = false,
      this.display = TextInputType.text,
      this.isEnabled = true});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: controller,
        obscureText: isObscureText,
        keyboardType: display,
        enabled: isEnabled,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Please Enter $hintName';
          }
          if (hintName == "Email" && !validateEmail(val)) {
            return 'Please Enter A Valid Emil';
          }
          return null;
        },
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            prefixIcon: Icon(icon),
            hintText: hintName,
            labelText: hintName,
            filled: true,
            fillColor: Colors.grey[200]),
      ),
    );
  }
}
