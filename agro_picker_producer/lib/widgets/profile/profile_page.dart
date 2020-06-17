import 'dart:io';

import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_producer/agro_picker_producer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  final int stepIndex;
  final GlobalKey<FormState> basicInfoKey;
  final GlobalKey<FormState> contactInfoKey;
  final GlobalKey<FormState> businessInfoKey;
  final ProfileController profileController;

  ProfilePage(
      {this.stepIndex,
      this.basicInfoKey,
      this.contactInfoKey,
      this.businessInfoKey,
      this.profileController});

  @override
  State<StatefulWidget> createState() {
    return _ProfilePage(profileController: profileController);
  }
}

class _ProfilePage extends State<ProfilePage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController nicController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController businessController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final ProfileController profileController;
  File profilePic;
  File businessRegPic;
  String genderDropDownValue;
  Gender selectedGender;
  ProfileBloc profileBloc;
  String profileTypeDropDownValue;
  ProfileType selectedProfileType;
  FileuploadBloc fileuploadBloc;

  _ProfilePage({this.profileController}) {
    profileController.completeProfile = completeProfile;
    profileController.uploadFile = uploadFiles;
    profileController.updateProfile = updateProfile;
  }

  @override
  void initState() {
    super.initState();
    profileBloc = BlocProvider.of<ProfileBloc>(context);
    fileuploadBloc = BlocProvider.of<FileuploadBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stepper(
        steps: getSteps(context),
        type: StepperType.horizontal,
        currentStep: widget.stepIndex,
        controlsBuilder: (context, {onStepContinue, onStepCancel}) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(),
              Container(),
            ],
          );
        },
      ),
    );
  }

  List<Step> getSteps(BuildContext context) {
    return [
      Step(
        title: Container(),
        content: ProfileBasicInfo(
          firstNameController: firstNameController,
          lastNameController: lastNameController,
          formKey: widget.basicInfoKey,
          nicController: nicController,
          genderDropdownChange: genderDropDownChange,
          genderDropDownValue: genderDropDownValue,
          getSelectedProfilePic: getProfilePicFile,
        ),
        state: _getState(0),
      ),
      Step(
        title: Container(),
        content: ProfileContactInfo(
          formKey: widget.contactInfoKey,
          mobileController: mobileController,
          provinceController: provinceController,
          addressController: addressController,
          cityController: cityController,
          districtController: districtController,
          postalCodeController: postalCodeController,
        ),
        state: _getState(1),
      ),
      Step(
        title: Container(),
        content: ProfileBusinessInfo(
          businessRegistrationController: businessController,
          getBusinessPic: getBusinessRegPicFile,
          profileTypeDropdownChange: profileTypeDropDownChange,
          profileTypeDropdownValue: profileTypeDropDownValue,
          businessInfoKey: widget.businessInfoKey,
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

  void genderDropDownChange(String selectedValue) {
    setState(() {
      genderDropDownValue = selectedValue;
      selectedGender = Gender.values
          .firstWhere((element) => element.asString() == selectedValue);
    });
  }

  void profileTypeDropDownChange(String selectedValue) {
    setState(() {
      profileTypeDropDownValue = selectedValue;
      selectedProfileType = ProfileType.values
          .firstWhere((element) => element.asString() == selectedValue);
    });
  }

  void getProfilePicFile(File selectedFile) {
    if (selectedFile != null) {
      setState(() {
        profilePic = selectedFile;
      });
      profileController.isFileSelected = true;
    } else {
      print('No File has been selected');
      profileController.isFileSelected = false;
    }
  }

  void getBusinessRegPicFile(File selectedFile) {
    if (selectedFile != null) {
      setState(() {
        businessRegPic = selectedFile;
      });
      profileController.isFileSelected = true;
    } else {
      print('No File has been selected');
      profileController.isFileSelected = false;
    }
  }

  void completeProfile() {
    profileController.userProfile = Users(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        gender: selectedGender,
        mobileNumber: mobileController.text.trim(),
        nic: nicController.text.trim(),
        addressDetails: AddressDetails(
            addressController.text.trim(),
            cityController.text.trim(),
            districtController.text.trim(),
            provinceController.text.trim(),
            postalCodeController.text.trim()),
        dateTime: Timestamp.now(),
        isProfileCompleted: true,
        agroProfile: AgroProfile(
            regNumber: businessController.text.trim(),
            profileType: selectedProfileType),
        role: 1,
        isOnline: true);
    profileBloc.add(InsertProfile(user: profileController.userProfile));
  }

  void uploadFiles() {
    if (profilePic != null) {
      fileuploadBloc.add(StartFileUploading(
          profilePic, FileUploadType.ProfilePicture,
          directory: 'users'));
    }
    if (businessRegPic != null) {
      fileuploadBloc.add(StartFileUploading(
          businessRegPic, FileUploadType.BusinessDocument,
          directory: 'users'));
    }
  }

  void updateProfile(Users users) {
    profileBloc.add(UpdateProfile(users: users));
  }
}
