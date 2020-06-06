import 'package:flutter/material.dart';
import 'package:agro_picker_producer/agro_picker_producer.dart';

class RegistrationPage extends StatefulWidget {
  final int stepIndex;

  RegistrationPage({this.stepIndex});

  @override
  State<StatefulWidget> createState() {
    return _RegistrationPage();
  }
}

class _RegistrationPage extends State<RegistrationPage> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _mobileNumberEditingController =
      TextEditingController();
  final TextEditingController _nicPassportEditingController =
      TextEditingController();
  final TextEditingController _provinceEditingController =
      TextEditingController();
  final TextEditingController _genderEditingController =
      TextEditingController();
  bool isLoading = true;
  final _formKey = GlobalKey<FormState>();
  int stepIndex = 0;
  List<Step> steps = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        height: 500,
        margin: EdgeInsets.only(top: 10),
        child: Stepper(
            type: StepperType.horizontal,
            currentStep: widget.stepIndex,
            steps: getSteps(context),
            onStepContinue: () {},
            onStepCancel: () {},
            controlsBuilder: (context,
                    {VoidCallback onStepContinue, VoidCallback onStepCancel}) =>
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(),
                        Container(),
                      ],
                    )
                  ],
                )),
      ),
    );
  }

  List<Step> getSteps(BuildContext context) {
    steps = [
      Step(
        title: Container(),
        content: Text('General Information'),
        state: _getState(0),
      ),
      Step(
        title: Container(),
        content: Text('General Information1'),
        state: _getState(1),
      ),
      Step(
        title: Container(),
        content: Text('General Information2'),
        state: _getState(2),
      ),
    ];

    return steps;
  }

  StepState _getState(int index) {
    if (widget.stepIndex > index) {
      return StepState.complete;
    }
    return StepState.indexed;
  }

  void stepNext() {
    setState(() {
      if (stepIndex != steps.length) {
        stepIndex++;
      }
    });
  }

  void stepPrevious() {}
}
