import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: Color(0xFF387002),
    accentColor: Color(0xFFFF970D),
    hintColor: Colors.black26,
    dividerColor: Colors.white,
    buttonColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.robotoTextTheme(
      TextTheme(
        button: TextStyle(fontWeight: FontWeight.bold),
        bodyText1: TextStyle(fontWeight: FontWeight.bold),
        bodyText2: TextStyle(fontWeight: FontWeight.bold),
        caption: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.grey[400], fontSize: 16),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xFF387002),
      shape: RoundedRectangleBorder(),
    ),
    canvasColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
