import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_producer/agro_picker_producer.dart';
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
  int stepsCount = 3;
  final GlobalKey<FormState> basicInfoKey = GlobalKey<FormState>();
  final GlobalKey<FormState> contactInfoKey = GlobalKey<FormState>();
  final GlobalKey<FormState> businessInfoKey = GlobalKey<FormState>();
  final ProfileController profileController = ProfileController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileCreationLoading) {
          return SplashScreen();
        }
        if (state is ProfileCreationLoaded) {
          return Home();
        }

        return WillPopScope(
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: Text('Profile'),
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(LoggedOut());
                      }),
                ),
                body: GestureDetector(
                  child: ProfilePage(
                    basicInfoKey: basicInfoKey,
                    contactInfoKey: contactInfoKey,
                    businessInfoKey: businessInfoKey,
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
                      stepIndex == 0
                          ? Container(
                              height: 0,
                            )
                          : FlatButton(
                              onPressed: () {
                                if (stepIndex > 0) {
                                  setState(() {
                                    stepIndex--;
                                  });
                                }
                              },
                              child: Text('Previous')),
                      stepIndex == stepsCount - 1
                          ? FlatButton(
                              onPressed: () {
                                if (businessInfoKey.currentState.validate()) {
                                  profileController.completeProfile();
                                }
                              },
                              child: Text('Finish'))
                          : FlatButton(
                              onPressed: () {
                                if (stepIndex == 0) {
                                  if (basicInfoKey.currentState.validate()) {
                                    setState(() {
                                      stepIndex++;
                                    });
                                  }
                                } else if (stepIndex == 1) {
                                  if (contactInfoKey.currentState.validate()) {
                                    setState(() {
                                      stepIndex++;
                                    });
                                  }
                                }
                              },
                              child: Text('Next'))
                    ],
                  ),
                ),
              ),
            ),
            onWillPop: () async {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              return false;
            });
      },
    );
  }
}
