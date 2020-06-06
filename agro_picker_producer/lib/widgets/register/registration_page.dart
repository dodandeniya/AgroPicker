import 'package:flutter/material.dart';
import 'package:agro_picker_producer/agro_picker_producer.dart';

class RegistrationPage extends StatefulWidget {
  final int stepIndex;
  final List<Step> steps;
  final GlobalKey<FormState> formKey;

  RegistrationPage({this.stepIndex, this.steps, this.formKey});

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Stepper(
            physics: AlwaysScrollableScrollPhysics(),
            type: StepperType.horizontal,
            currentStep: widget.stepIndex,
            steps: getSteps(context),
            controlsBuilder: (context,
                    {VoidCallback onStepContinue, VoidCallback onStepCancel}) =>
                Column(
                  children: <Widget>[
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
    return [
      Step(
        title: Container(),
        content: RegistrationGeneralInformation(
          formKey: widget.formKey,
        ),
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
  }

  StepState _getState(int index) {
    if (widget.stepIndex > index) {
      return StepState.complete;
    }
    if (widget.stepIndex == index) {
      return StepState.editing;
    }
    return StepState.indexed;
  }
}
