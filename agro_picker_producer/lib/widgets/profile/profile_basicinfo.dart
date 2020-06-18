import 'dart:io';

import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileBasicInfo extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController nicController;
  final Function genderDropdownChange;
  final Function getSelectedProfilePic;
  final String genderDropDownValue;

  ProfileBasicInfo(
      {this.formKey,
      this.firstNameController,
      this.lastNameController,
      this.genderDropDownValue,
      this.genderDropdownChange,
      this.nicController,
      this.getSelectedProfilePic});

  @override
  State<StatefulWidget> createState() {
    return _ProfileBasicInfo();
  }
}

class _ProfileBasicInfo extends State<ProfileBasicInfo> {
  final List<String> genderList = [
    Gender.Male.asString(),
    Gender.Female.asString()
  ];

  File _image;
  final picker = ImagePicker();
  bool isImageAvailable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          key: widget.formKey,
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: _image == null
                            ? CircleAvatar(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                radius: 50,
                                child: Icon(
                                  Icons.person,
                                  size: 50,
                                ),
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                radius: 50,
                                backgroundImage: FileImage(_image),
                              ),
                      ),
                      Positioned(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            tooltip: 'Select an Image from Gallery',
                            color: Colors.white,
                            constraints: BoxConstraints(),
                            icon: Icon(
                              Icons.add_a_photo,
                              size: 20,
                            ),
                            onPressed: getImage,
                          ),
                        ),
                        bottom: 0.0,
                        right: 0.0,
                      )
                    ],
                  )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: widget.firstNameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Your First Name';
                    }
                    return null;
                  },
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: 'First Name',
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
                  controller: widget.lastNameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Your Last Name';
                    }
                    return null;
                  },
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                    labelText: 'NIC/Passport',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    contentPadding: EdgeInsets.only(
                        top: 0, bottom: 10, left: 10, right: 10),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: DropdownButtonFormField<String>(
                  validator: (value) {
                    if (value == null) {
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
                    widget.genderDropdownChange(newValue);
                    FocusScope.of(context).nextFocus();
                  },
                  value: widget.genderDropDownValue,
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
            ],
          ),
        )
      ],
    );
  }

  Future<void> getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(
        () {
          _image = File(pickedFile.path);
          widget.getSelectedProfilePic(_image);
        },
      );
    }
  }
}
