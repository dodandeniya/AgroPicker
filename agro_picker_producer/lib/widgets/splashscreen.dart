import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final String message;
  SplashScreen(this.message);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          SizedBox(
            height: 50,
          ),
          Text(message),
        ],
      )),
    );
  }
}
