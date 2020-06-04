import 'package:agro_picker_consumer/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: TextFormField(
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
                      onPressed: () {
                        setState(() {
                          isLoading = false;
                        });
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
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: RaisedButton(
                      color: Theme.of(context).accentColor,
                      onPressed: () {},
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
    );
  }
}
