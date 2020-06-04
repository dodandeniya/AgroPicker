import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: Colors.green[300],
    accentColor: Colors.orange,
    hintColor: Colors.black26,
    dividerColor: Colors.white,
    buttonColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: ButtonThemeData(
           buttonColor: Colors.blueAccent,
           shape: RoundedRectangleBorder(),
           textTheme: ButtonTextTheme.primary,
    ),
    canvasColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}