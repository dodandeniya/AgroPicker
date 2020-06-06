import 'package:flutter/material.dart';

class RegistrationGeneralInformation extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  RegistrationGeneralInformation({this.formKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                alignment: Alignment.centerLeft,
                child: Text('General Information'),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
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
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Select Gender';
                    }
                    return null;
                  },
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
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter NIC/Passport';
                    }
                    return null;
                  },
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
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Province/State';
                    }
                    return null;
                  },
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
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Mobile Number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Mobile Number',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    contentPadding: EdgeInsets.only(
                        top: 0, bottom: 10, left: 10, right: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
