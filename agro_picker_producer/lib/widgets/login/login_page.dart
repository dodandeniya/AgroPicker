import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_producer/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  final TextEditingController _userNameEditingController =
      TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  bool isLoading = true;

  LoginBloc _loginBloc;
  AgroprofileBloc _agroprofileBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _agroprofileBloc = BlocProvider.of<AgroprofileBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.isFailure) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Login Failure'), Icon(Icons.error)],
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                setState(() {
                  isLoading = true;
                });
              }
              if (state.isSubmitting) {
                setState(() {
                  isLoading = false;
                });
              }
              if (!state.isEmailVerified && state.isSuccess) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Email Address has not been verified yet.'),
                          Icon(Icons.error)
                        ],
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                setState(() {
                  isLoading = true;
                });
              }
              if (state.isSuccess && state.isEmailVerified) {
                _agroprofileBloc.add(CheckProfileState());
              }
            },
          ),
          BlocListener<AgroprofileBloc, AgroprofileState>(
            listener: (context, state) {
              if (state is Pending) {
                BlocProvider.of<AuthenticationBloc>(context).add(
                  LoggedOut(),
                );
                _agroprofileBloc.add(ResetPrefileState());
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Profile is pending'),
                          Icon(Icons.warning)
                        ],
                      ),
                      backgroundColor: Colors.orange[300],
                    ),
                  );
                setState(() {
                  isLoading = true;
                });
              }

              if (state is Rejected) {
                BlocProvider.of<AuthenticationBloc>(context).add(
                  LoggedOut(),
                );
                _agroprofileBloc.add(ResetPrefileState());
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Profile is rejected'),
                          Icon(Icons.error)
                        ],
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                setState(() {
                  isLoading = true;
                });
              }

              if (state is Approved) {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
                _agroprofileBloc.add(ResetPrefileState());
              }
            },
          ),
        ],
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(
                  child: Image.asset('assets/images/logo.png'),
                ),
                Card(
                  elevation: 4,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: TextFormField(
                          controller: _userNameEditingController,
                          decoration: InputDecoration(
                            hintText: 'User Name',
                            hintStyle: Theme.of(context).textTheme.caption,
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
                          obscureText: true,
                          controller: _passwordEditingController,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: Theme.of(context).textTheme.caption,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            contentPadding: EdgeInsets.only(
                                top: 0, bottom: 10, left: 10, right: 10),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: RaisedButton(
                          textTheme: ButtonTextTheme.primary,
                          onPressed: !isLoading
                              ? null
                              : () {
                                  _loginBloc.add(LoginWithCredentialsPressed(
                                      email: _userNameEditingController.text,
                                      password:
                                          _passwordEditingController.text));
                                },
                          child: isLoading
                              ? Text(
                                  'LOGIN',
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
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: <Widget>[
                      Text('New User?',
                          style: Theme.of(context).textTheme.bodyText1),
                      Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: RaisedButton(
                          color: Theme.of(context).accentColor,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Registration(),
                              ),
                            );
                          },
                          child: Text(
                            'REGISTER',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
