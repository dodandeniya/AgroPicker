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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: <Widget>[
              SingleChildScrollView(
                child: RegistrationPage(
                  stepIndex: stepIndex,
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Card(
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
                        setState(() {
                          stepIndex++;
                        });
                      },
                      child: Text('Next'))
            ],
          ),
        ),
      ),
    );
  }
}
