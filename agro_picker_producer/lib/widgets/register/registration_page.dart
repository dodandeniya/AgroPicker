import 'package:flutter/material.dart';
import 'package:agro_picker_producer/agro_picker_producer.dart';

class RegistrationPage extends StatefulWidget {
  final int stepIndex;
  final GlobalKey<FormState> genInfoKey;
  final GlobalKey<FormState> emailKey;
  final GlobalKey<FormState> passwordKey;

  RegistrationPage(
      {this.stepIndex, this.genInfoKey, this.emailKey, this.passwordKey});

  @override
  State<StatefulWidget> createState() {
    return _RegistrationPage();
  }
}

class _RegistrationPage extends State<RegistrationPage> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _confirmPasswordEditingController =
      TextEditingController();
  final TextEditingController _mobileNumberEditingController =
      TextEditingController();
  final TextEditingController _nicPassportEditingController =
      TextEditingController();
  final TextEditingController _provinceEditingController =
      TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _userNameEditingController =
      TextEditingController();
  String genderDropDownValue;

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
          formKey: widget.genInfoKey,
          userNameController: _nameEditingController,
          mobileController: _mobileNumberEditingController,
          nicController: _nicPassportEditingController,
          provinceController: _provinceEditingController,
          genderDropDownChange: genderDropDownChange,
          genderDropDownValue: genderDropDownValue,
        ),
        state: _getState(0),
      ),
      Step(
        title: Container(),
        content: RegistrationEmail(
          emailController: _emailEditingController,
          userNameController: _userNameEditingController,
          formKey: widget.emailKey,
        ),
        state: _getState(1),
      ),
      Step(
        title: Container(),
        content: RegistrationPassword(
          confirmPasswordController: _confirmPasswordEditingController,
          passwordController: _passwordEditingController,
          formKey: widget.passwordKey,
        ),
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

  void genderDropDownChange(String selected) {
    setState(() {
      genderDropDownValue = selected;
    });
  }

  @override
  void dispose() {
    _userNameEditingController.dispose();
    _confirmPasswordEditingController.dispose();
    _emailEditingController.dispose();
    _mobileNumberEditingController.dispose();
    _nameEditingController.dispose();
    _nicPassportEditingController.dispose();
    _passwordEditingController.dispose();
    _provinceEditingController.dispose();
    super.dispose();
  }
}
