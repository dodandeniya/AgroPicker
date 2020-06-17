import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_consumer/controllers/controllers.dart';
import 'package:agro_picker_consumer/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Profile();
  }
}

class _Profile extends State<Profile> {
  int stepIndex = 0;
  int stepsCount = 1;
  final GlobalKey<FormState> basicInfoKey = GlobalKey<FormState>();
  final ProfileController profileController = ProfileController();
  bool isLoading = false;
  String message = '';

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileCreationLoading) {
              setState(() {
                isLoading = true;
                message = 'Profile is getting Created';
              });
            }
            if (state is ProfileCreationLoaded) {
              if (profileController.isFileSelected) {
                profileController.uploadFile();
              } else {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              }
            }
            if (state is ProfileUpdated) {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            }
          },
        ),
        BlocListener<FileuploadBloc, FileuploadState>(
          listener: (context, state) {
            if (state is Fileuploading) {
              setState(() {
                isLoading = true;
                message = 'Files are getting uploaded';
              });
            }
            if (state is FileuploadCompleted) {
              if (state.fileUploadType == FileUploadType.ProfilePicture) {
                profileController.userProfile.profileImage =
                    state.downloadableUrl;
                var user = profileController.userProfile;
                profileController.updateProfile(user);
              }
              if (state.fileUploadType == FileUploadType.BusinessDocument) {
                profileController.userProfile.agroProfile
                    .businessRegistrationDoc = state.downloadableUrl;
                var user = profileController.userProfile;
                profileController.updateProfile(user);
              }
            }
          },
        )
      ],
      child: getWidget(),
    );
  }

  Widget getWidget() {
    if (isLoading) {
      return SplashScreen(message);
    }

    return WillPopScope(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                }),
          ),
          body: GestureDetector(
            child: ProfilePage(
              basicInfoKey: basicInfoKey,
              stepIndex: stepIndex,
              profileController: profileController,
            ),
            onTap: () {
              FocusScope.of(context).unfocus();
            },
          ),
          bottomNavigationBar: Card(
            elevation: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      if (basicInfoKey.currentState.validate()) {
                        profileController.completeProfile();
                      }
                    },
                    child: Text('Finish'))
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async {
        BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
        return false;
      },
    );
  }
}
