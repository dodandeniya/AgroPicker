import 'package:agro_picker_consumer/main.dart';
import 'package:flutter/material.dart';

class RegistrationSucess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 75,
          ),
          SizedBox(
            height: 50,
          ),
          Text('Registration Completed'),
          SizedBox(
            height: 25,
          ),
          Center(
            child: Text(
              'A Verification Link has been sent to the registered Email Address, Please verify before login',
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          RaisedButton(
            textTheme: ButtonTextTheme.primary,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Main(),
                  ),
                  (Route<dynamic> route) => false);
            },
            child: Text(
              'Back to Login',
            ),
          )
        ],
      ),
    );
  }
}
