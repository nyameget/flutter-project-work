// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Zoom(
        initZoom: 0,
        centerOnScale: true,
        enableScroll: true,
        zoomSensibility: 2.0,
        doubleTapZoom: true,
        maxZoomHeight: 1800,
        maxZoomWidth: 1800,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset('images/Timetable.png'),
        ),
      ),
    );
  }
}
