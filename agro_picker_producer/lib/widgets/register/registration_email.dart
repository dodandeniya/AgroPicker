import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_bloc/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationEmail extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  RegistrationEmail(
      {this.formKey,
      this.emailController,
      this.passwordController,
      this.confirmPasswordController});

  @override
  State<StatefulWidget> createState() {
    return _RegistrationEmail();
  }
}

class _RegistrationEmail extends State<RegistrationEmail> {
  bool isLoading = true;
  RegisterBloc _registerBloc;

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Form(
            key: widget.formKey,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 25),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
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
                    controller: widget.emailController,
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      hintStyle: Theme.of(context).textTheme.caption,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      contentPadding: EdgeInsets.only(
                          top: 0, bottom: 10, left: 10, right: 15),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Password';
                      } else {
                        if (!EmailValidators.isValidPassword(value)) {
                          return 'Please choose a stronger password. It should include mix of letters, a number and a symbol.';
                        }
                      }
                      return null;
                    },
                    controller: widget.passwordController,
                    decoration: InputDecoration(
                      errorMaxLines: 20,
                      hintText: 'Password',
                      hintStyle: Theme.of(context).textTheme.caption,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      contentPadding: EdgeInsets.only(
                          top: 0, bottom: 10, left: 10, right: 15),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
                    obscureText: true,
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
                    decoration: InputDecoration(
                      errorMaxLines: 20,
                      hintText: 'Confirm Password',
                      hintStyle: Theme.of(context).textTheme.caption,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      contentPadding: EdgeInsets.only(
                          top: 0, bottom: 10, left: 10, right: 15),
                    ),
                  ),
                ),
                BlocListener<RegisterBloc, RegisterState>(
                  listener: (context, state) {
                    if (state.isSubmitting) {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: RaisedButton(
                      textTheme: ButtonTextTheme.primary,
                      onPressed: !isLoading
                          ? null
                          : () {
                              if (widget.formKey.currentState.validate()) {
                                _registerBloc.add(
                                  RegisterSubmitted(
                                    email: widget.emailController.text.trim(),
                                    password:
                                        widget.passwordController.text.trim(),
                                  ),
                                );
                              }
                            },
                      child: isLoading
                          ? Text(
                              'REGISTER',
                            )
                          : Container(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.lightBlue),
                              ),
                              width: 25,
                              height: 25,
                            ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
