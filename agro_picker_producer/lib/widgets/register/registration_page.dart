import 'package:agro_picker_producer/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Name';
                          }
                          return null;
                        },
                        controller: _nameEditingController,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          contentPadding: EdgeInsets.only(
                              top: 0, bottom: 10, left: 10, right: 15),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Select Gender';
                          }
                          return null;
                        },
                        controller: _genderEditingController,
                        decoration: InputDecoration(
                          hintText: 'Gender',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          contentPadding: EdgeInsets.only(
                              top: 0, bottom: 10, left: 10, right: 10),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter NIC/Passport';
                          }
                          return null;
                        },
                        controller: _nicPassportEditingController,
                        decoration: InputDecoration(
                          hintText: 'NIC/Passport',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          contentPadding: EdgeInsets.only(
                              top: 0, bottom: 10, left: 10, right: 10),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Province/State';
                          }
                          return null;
                        },
                        controller: _provinceEditingController,
                        decoration: InputDecoration(
                          hintText: 'Province/State',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          contentPadding: EdgeInsets.only(
                              top: 0, bottom: 10, left: 10, right: 10),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Mobile Number';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        controller: _mobileNumberEditingController,
                        decoration: InputDecoration(
                          hintText: 'Mobile Number',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          contentPadding: EdgeInsets.only(
                              top: 0, bottom: 10, left: 10, right: 10),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                        controller: _passwordEditingController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          contentPadding: EdgeInsets.only(
                              top: 0, bottom: 10, left: 10, right: 15),
                        ),
                      ),
                    ),
                    RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {}
                          // setState(() {
                          //   isLoading = false;
                          // });
                        },
                        child: isLoading
                            ? Text(
                                'Save',
                                style: TextStyle(color: Colors.white),
                              )
                            : Container(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.lightBlue),
                                ),
                                width: 25,
                                height: 25,
                              )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
