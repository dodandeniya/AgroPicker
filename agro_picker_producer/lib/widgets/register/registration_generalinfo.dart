import 'package:flutter/material.dart';

class RegistrationGeneralInformation extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController userNameController;
  final TextEditingController nicController;
  final TextEditingController provinceController;
  final TextEditingController mobileController;
  final Function dropDownChange;
  final String dropDownValue;

  RegistrationGeneralInformation(
      {this.formKey,
      this.userNameController,
      this.nicController,
      this.provinceController,
      this.mobileController,
      this.dropDownChange,
      this.dropDownValue});

  @override
  State<StatefulWidget> createState() {
    return _RegistrationGeneralInformation();
  }
}

class _RegistrationGeneralInformation
    extends State<RegistrationGeneralInformation> {
  final List<String> genderList = ['Male', 'Female', 'Other'];

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
                child: Text('General Information'),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: widget.userNameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
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
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: DropdownButtonFormField<String>(
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
                  isExpanded: true,
                  iconSize: 24,
                  elevation: 24,
                  onChanged: (String newValue) {
                    widget.dropDownChange(newValue);
                  },
                  value: widget.dropDownValue,
                  items: genderList
                      .map<DropdownMenuItem<String>>(
                        (e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter NIC/Passport';
                    }
                    return null;
                  },
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                  controller: widget.nicController,
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
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Province/State';
                    }
                    return null;
                  },
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                  controller: widget.provinceController,
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
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Mobile Number';
                    }
                    return null;
                  },
                  controller: widget.mobileController,
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
