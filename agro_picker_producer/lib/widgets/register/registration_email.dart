import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:flutter/material.dart';

class RegistrationEmail extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController userNameController;

  RegistrationEmail(
      {this.formKey, this.emailController, this.userNameController});

  @override
  State<StatefulWidget> createState() {
    return _RegistrationEmail();
  }
}

class _RegistrationEmail extends State<RegistrationEmail> {
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
                child: Text('Email and Username Information'),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: widget.emailController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Email Address';
                    } else {
                      if (!EmailValidators.isValidEmail(value)) {
                        return 'Please Enter A Valid Email Address';
                      }
                    }
                    return null;
                  },
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                  decoration: InputDecoration(
                    hintText: 'Email Address',
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
                  textInputAction: TextInputAction.next,
                  controller: widget.userNameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Username';
                    }
                    return null;
                  },
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                  decoration: InputDecoration(
                    hintText: 'Username',
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
