import 'package:flutter/material.dart';
import 'package:agro_picker_producer/agro_picker_producer.dart';

class Registration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Registration();
  }
}

class _Registration extends State<Registration> {
  int stepIndex = 0;
  int stepsCount = 3;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        primary: true,
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Register'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: RegistrationPage(
            stepIndex: stepIndex,
            formKey: _formKey,
          ),
        ),
        bottomNavigationBar: Card(
          elevation: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              stepIndex == 0
                  ? Container(
                      height: 0,
                    )
                  : FlatButton(
                      onPressed: () {
                        if (stepIndex > 0) {
                          setState(() {
                            stepIndex--;
                          });
                        }
                      },
                      child: Text('Previous')),
              stepIndex == stepsCount - 1
                  ? FlatButton(onPressed: () {}, child: Text('Finish'))
                  : FlatButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            stepIndex++;
                          });
                        }
                      },
                      child: Text('Next'))
            ],
          ),
        ),
      ),
    );
  }
}
