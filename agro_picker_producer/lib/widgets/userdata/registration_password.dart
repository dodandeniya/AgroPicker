import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:flutter/material.dart';

class RegistrationPassword extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  RegistrationPassword(
      {this.formKey, this.passwordController, this.confirmPasswordController});

  @override
  State<StatefulWidget> createState() {
    return _RegistrationPassword();
  }
}

class _RegistrationPassword extends State<RegistrationPassword> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          key: widget.formKey,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                alignment: Alignment.centerLeft,
                child: Text('Password Information'),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.visiblePassword,
                  controller: widget.passwordController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Password';
                    } else {
                      // if (!EmailValidators.isValidPassword(value)) {
                      //   return 'Please Enter A Valid Password';
                      // }
                    }
                    return null;
                  },
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    contentPadding: EdgeInsets.only(
                        top: 0, bottom: 10, left: 10, right: 15),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  controller: widget.confirmPasswordController,
                  onChanged: (value) {
                    if (value != widget.passwordController.text) {
                      widget.formKey.currentState.validate();
                    } else {
                      widget.formKey.currentState.validate();
                    }
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Confirm Password';
                    } else {
                      if (value != widget.passwordController.text) {
                        return 'Confirm Password should be same as the Password';
                      }
                    }
                    return null;
                  },
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    contentPadding: EdgeInsets.only(
                        top: 0, bottom: 10, left: 10, right: 15),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
