import 'dart:async';
import 'dart:io';

import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_producer/agro_picker_producer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileBusinessInfo extends StatefulWidget {
  final TextEditingController businessRegistrationController;
  final Function getSelectedFile;
  final Function profileTypeDropdownChange;
  final String profileTypeDropdownValue;
  final GlobalKey<FormState> businessInfoKey;

  ProfileBusinessInfo({
    this.businessRegistrationController,
    this.getSelectedFile,
    this.profileTypeDropdownChange,
    this.profileTypeDropdownValue,
    this.businessInfoKey,
  });

  @override
  State<StatefulWidget> createState() {
    return _ProfileBusinessInfo();
  }
}

class _ProfileBusinessInfo extends State<ProfileBusinessInfo> {
  File selectedFile;
  FilePickController filePickController = FilePickController();
  StreamSubscription streamSubscription;
  final List<String> profileTypes = [
    ProfileType.HomeGardner.asString(),
    ProfileType.Small.asString(),
    ProfileType.Medium.asString(),
    ProfileType.Large.asString(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          key: widget.businessInfoKey,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.visiblePassword,
                  controller: widget.businessRegistrationController,
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                  decoration: InputDecoration(
                    labelText: 'Business Registration Number',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                    if (value == null &&
                        widget.businessRegistrationController.text.isNotEmpty) {
                      return 'Please Select Profile Type';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Profile Type',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    contentPadding: EdgeInsets.only(
                        top: 0, bottom: 10, left: 10, right: 10),
                  ),
                  isExpanded: true,
                  iconSize: 24,
                  elevation: 24,
                  onChanged: (String newValue) {
                    widget.profileTypeDropdownChange(newValue);
                    FocusScope.of(context).nextFocus();
                  },
                  value: widget.profileTypeDropdownValue,
                  items: profileTypes
                      .map<DropdownMenuItem<String>>(
                        (e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                textTheme: ButtonTextTheme.primary,
                onPressed: () async {
                  selectedFile = await filePickController.openFileExplorer();
                  widget.getSelectedFile(selectedFile);
                  Stream<File> fileStream = filePickController.clearFile();
                  streamSubscription = fileStream.listen((onData) {
                    setState(() {
                      selectedFile = onData;
                    });
                    widget.getSelectedFile(selectedFile);
                    streamSubscription.cancel();
                  });
                },
                child: Text("Select File"),
              ),
              SizedBox(
                height: 50,
              ),
              FilePick(
                filePickController: filePickController,
              ),
            ],
          ),
        )
      ],
    );
  }
}
