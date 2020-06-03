import 'package:flutter/material.dart';

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
      height: MediaQuery.of(context).size.height,
      color: Colors.greenAccent,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Image.asset('assets/logo.png'),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: TextFormField(
                      controller: _userNameEditingController,
                      decoration: InputDecoration(
                        hintText: 'User Name',
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
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        contentPadding: EdgeInsets.only(
                            top: 0, bottom: 10, left: 10, right: 10),
                      ),
                    ),
                  ),
                  RaisedButton(
                      color: Colors.blue[900],
                      onPressed: () {
                        setState(() {
                          isLoading = false;
                        });
                      },
                      child: isLoading
                          ? Text(
                              'Sign In',
                              style: TextStyle(color: Colors.white),
                            )
                          : Container(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.lightBlue),
                              ),
                              width: 25,
                              height: 25,
                            )),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Text('New User?'),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'Registration',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
