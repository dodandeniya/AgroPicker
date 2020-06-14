import 'package:flutter/material.dart';

class ProfileContactInfo extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController provinceController;
  final TextEditingController mobileController;
  final TextEditingController cityController;
  final TextEditingController addressController;
  final TextEditingController districtController;
  final TextEditingController postalCodeController;

  ProfileContactInfo({
    this.formKey,
    this.provinceController,
    this.mobileController,
    this.addressController,
    this.cityController,
    this.districtController,
    this.postalCodeController,
  });

  @override
  State<StatefulWidget> createState() {
    return _ProfileContactInfo();
  }
}

class _ProfileContactInfo extends State<ProfileContactInfo> {
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
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Mobile Number';
                    }
                    return null;
                  },
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                  controller: widget.mobileController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                      return 'Please Enter Address';
                    }
                    return null;
                  },
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                  controller: widget.addressController,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: 'Address',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    contentPadding: EdgeInsets.only(
                        top: 0, bottom: 10, left: 10, right: 10),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter City';
                        }
                        return null;
                      },
                      onEditingComplete: () {
                        FocusScope.of(context).nextFocus();
                      },
                      controller: widget.cityController,
                      decoration: InputDecoration(
                        errorMaxLines: 20,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'City',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        contentPadding: EdgeInsets.only(
                            top: 0, bottom: 10, left: 10, right: 10),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter District';
                        }
                        return null;
                      },
                      onEditingComplete: () {
                        FocusScope.of(context).nextFocus();
                      },
                      controller: widget.districtController,
                      decoration: InputDecoration(
                        errorMaxLines: 20,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'District',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        contentPadding: EdgeInsets.only(
                            top: 0, bottom: 10, left: 10, right: 10),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Province';
                        }
                        return null;
                      },
                      onEditingComplete: () {
                        FocusScope.of(context).nextFocus();
                      },
                      controller: widget.provinceController,
                      decoration: InputDecoration(
                        errorMaxLines: 20,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'Province',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        contentPadding: EdgeInsets.only(
                            top: 0, bottom: 10, left: 10, right: 10),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Postal Code';
                        }
                        return null;
                      },
                      onEditingComplete: () {
                        FocusScope.of(context).nextFocus();
                      },
                      controller: widget.postalCodeController,
                      decoration: InputDecoration(
                        errorMaxLines: 20,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'Postal Code',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        contentPadding: EdgeInsets.only(
                            top: 0, bottom: 10, left: 10, right: 10),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
